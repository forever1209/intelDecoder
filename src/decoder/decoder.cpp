#include "decoder.h"
namespace deva
{
    namespace mos
    {
        MachDecoder::MachDecoder(const FrameCodeType &code_type , const std::string & device   , const bool & save , std::function<void(DecoderCbInfo)> callback) : frame_codec_type_(code_type)
        {
            decode_callback = callback;
            m_bSaveTest_ = save;
            InitDecoder(device);
        }
        MachDecoder::~MachDecoder()
        {
            avcodec_free_context(&codec_context_);
            av_frame_free(&frame_);
            av_free(buffer);
            sws_freeContext(img_ctx);
            av_buffer_unref(&device_ref);
            std::cout<<"MachDecoder release \n";
        }
        void MachDecoder::DecodeOneFrame(const uint8_t* data,const  int &size , const uint64_t &timestamp)
        {
            DecodeFrame(data,size,timestamp);
        }
        void MachDecoder::DecodeOneFrame(const uint8_t* data,const  int &size , cv::Mat & image)
        {
            DecodeFrame(data,size,image);
        }
        void MachDecoder::DecodeFrame(const uint8_t* data,const  int &size , const uint64_t &timestamp)
        {
            AVPacket *packet = av_packet_alloc();
            packet->data = const_cast<uint8_t*>(data);
            packet->size = size;
            packet->side_data = reinterpret_cast<AVPacketSideData*>(av_malloc(sizeof(AVPacketSideData)));
            AVPacketSideData* side_data = &packet->side_data[0];
            side_data->type = AV_PKT_DATA_NEW_EXTRADATA;
            side_data->size = sizeof(uint64_t);
            side_data->data = reinterpret_cast<uint8_t*>(av_malloc(side_data->size));
            memcpy(side_data->data, &timestamp, sizeof(uint64_t));
            int response = avcodec_send_packet(codec_context_, packet);
            if (response < 0) {
                std::cerr << "无法发送视频包给解码器";
                av_packet_free(&packet); // 释放 AVPacket 内存
                return ;
            }

            response = avcodec_receive_frame(codec_context_, frame_);
            if (response == AVERROR(EAGAIN) || response == AVERROR_EOF) {
                av_packet_free(&packet); // 释放 AVPacket 内存
                return ;
            }
            else if (response < 0) {
                std::cerr << "无法从解码器接收视频帧";
                av_packet_free(&packet); // 释放 AVPacket 内存
                return ;
            }
            uint64_t retrieved_timestamp = 0;
            memcpy(&retrieved_timestamp, packet->side_data->data, packet->side_data->size);

            av_packet_free(&packet); // 释放 AVPacket 内存
            if((decode_callback != nullptr))
            {
                DecoderCbInfo frame_info;
                frame_info.width = frame_->width;
                frame_info.height = frame_->height;
                frame_info.timestamp = retrieved_timestamp;

                ConverColorSpace(frame_ , frame_info.cv_data);
                // 调用回调函数
                decode_callback(frame_info);
            }
        }
        void MachDecoder::DecodeFrame(const uint8_t* data,const  int &size , cv::Mat & image)
        {
            auto begin = std::chrono::steady_clock::now();
            AVPacket *packet = av_packet_alloc();
            packet->data = const_cast<uint8_t*>(data);
            packet->size = size;

            int response = avcodec_send_packet(codec_context_, packet);
            if (response < 0) {
                std::cerr << "无法发送视频包给解码器" << std::endl;
                av_packet_free(&packet); // 释放 AVPacket 内存
                return ;
            }

            response = avcodec_receive_frame(codec_context_, frame_);
            if (response == AVERROR(EAGAIN) || response == AVERROR_EOF) {
                av_packet_free(&packet); // 释放 AVPacket 内存
                return ;
            }
            else if (response < 0) {
                std::cerr << "无法从解码器接收视频帧" << std::endl;
                av_packet_free(&packet); // 释放 AVPacket 内存
                return ;
            }
            auto end = std::chrono::steady_clock::now();
            // 处理视频帧数据，这里简单打印宽高信息
            std::cout << "解码得到视频帧，宽度：" << frame_->width << "，高度：" << frame_->height << "need time : " <<std::chrono::duration<double, std::milli>(end - begin).count() << std::endl;

            av_packet_free(&packet); // 释放 AVPacket 内存
            auto cover_begin = std::chrono::steady_clock::now();
            ConverColorSpace(frame_ , image);
            auto cover_end = std::chrono::steady_clock::now();
            std::cout<<"cover color need "<<std::chrono::duration<double, std::milli>(cover_end - cover_begin).count() << std::endl;
            if (image.empty()) {
                std::cerr << "Error: BGR image is empty after conversion." << std::endl;
            }
            AVPixelFormat pixel_format = (AVPixelFormat)frame_->format;
            const char* format_name = av_get_pix_fmt_name(pixel_format);
            // std::cout<<"receive from decoder "<<format_name<<std::endl;
        }
        void MachDecoder::InitDecoder(const std::string & device)
        {
            int ret = -1;
            if(!device.empty())
            {
              ret = av_hwdevice_ctx_create(&device_ref, AV_HWDEVICE_TYPE_QSV,
                                                                device.c_str(), NULL, 0);
            }
            
            bool l_bDecodeUseDevice = true;
            std::cerr<<"device open  "<<ret << std::endl;
            if(ret < 0 )
            {
                l_bDecodeUseDevice = false;
                std::cout<<"decode use soft \n";
            }
            switch (frame_codec_type_)
            {
            case CODE_TYPE_H264:
                if(l_bDecodeUseDevice == true)
                {
                    codec_ = const_cast<AVCodec*>(avcodec_find_decoder_by_name("h264_qsv"));
                }
                else
                {
                    codec_ = const_cast<AVCodec*>(avcodec_find_decoder(AV_CODEC_ID_H264));
                }
                break;
            case CODE_TYPE_H265:
                if(l_bDecodeUseDevice == true)
                {
                    codec_ = const_cast<AVCodec*>(avcodec_find_decoder_by_name("hevc_qsv"));
                }
                else
                {
                    codec_ = const_cast<AVCodec*>(avcodec_find_decoder(AV_CODEC_ID_H265));
                }
                break;
            default:
                break;
            }
            codec_context_ = avcodec_alloc_context3(codec_);
            if(l_bDecodeUseDevice == true)
            {
                codec_context_->hw_device_ctx = av_buffer_ref(device_ref);
                m_bHardwareDecode_ = true;
            }
            avcodec_open2(codec_context_, codec_, nullptr);
            frame_ = av_frame_alloc();
        }
        void MachDecoder::ConverColorSpace(AVFrame *srcFrame , cv::Mat & image)
        {
            if(srcFrame&&srcFrame->data&&srcFrame->width>0)
            {
                static bool uninited = true;
                if(uninited == true){

                    auto frame_size = av_image_get_buffer_size(AV_PIX_FMT_RGB24, srcFrame->width, srcFrame->height, 1);       //计算转换后的内存大小
                    buffer = (uint8_t *)av_malloc(frame_size * sizeof(uint8_t));
                    if(codec_context_->pix_fmt == AV_PIX_FMT_YUVJ420P)
                    {
                        codec_context_->pix_fmt = AV_PIX_FMT_YUV420P;
                    }
                    img_ctx = sws_getContext(srcFrame->width, srcFrame->height,
                                                                        codec_context_->pix_fmt, srcFrame->width, srcFrame->height,
                                                                        AV_PIX_FMT_RGB24, SWS_BICUBIC, NULL, NULL, NULL);
                    uninited = false;
                }

                AVFrame *pFrameRGB = av_frame_alloc();
                av_image_fill_arrays(pFrameRGB->data, pFrameRGB->linesize, buffer, AV_PIX_FMT_RGB24,srcFrame->width, srcFrame->height,1);

                sws_scale(img_ctx,
                        (uint8_t const * const *) srcFrame->data,
                        srcFrame->linesize, 0, srcFrame->height, pFrameRGB->data,
                        pFrameRGB->linesize);
                if(m_bSaveTest_ == true)
                {
                    static int index = 1;
                    SaveFrame(pFrameRGB,srcFrame->width, srcFrame->height,index);
                    index++;
                }
                image = cv::Mat(srcFrame->height, srcFrame->width, CV_8UC3, pFrameRGB->data[0], pFrameRGB->linesize[0]);
                
                av_frame_free(&pFrameRGB);
            }
        }
        void MachDecoder::SaveFrame(AVFrame *pFrame, int width, int height, int index)
        {
            FILE* pFile;
            char szFilename[32];
            int  y;
            // 打开输出文件
            sprintf(szFilename, "./img/frame%d.ppm", index);
            pFile = fopen(szFilename, "wb");
            if (pFile == NULL)
                return;
            // 写入头信息
            fprintf(pFile, "P6\n%d %d\n255\n", width, height);
            // 写入像素数据
            for (y = 0; y < height; y++) {
                fwrite(pFrame->data[0] + y * pFrame->linesize[0], 1, width * 3, pFile);
            }
            // 关闭输出文件
            fclose(pFile);
        }
    }
}
