#include "H265Reader.h"
extern "C" {
#include <libavutil/opt.h>
#include <libavformat/avformat.h>
#include <libavcodec/avcodec.h>
#include <libavutil/imgutils.h>
#include <libswscale/swscale.h>
}
namespace deva
{
    namespace mos
    {
        H265Reader::H265Reader()
        {
        }
        H265Reader::~H265Reader()
        {
            m_bRunning_ = false;
            if(m_pReadThread_->joinable())
            {
                m_pReadThread_->join();
            }
        }
        bool H265Reader::OpenFile(const std::string &fileName , std::function<void(const uint8_t* ,const  int &)> callback )
        {
            BaseReader::OpenFile(fileName , callback);
            return Open();
        }
        bool H265Reader::Open()
        {
            if(m_iFileType != 4)
            {
                return false;
            }
            //read_callback_
            m_bRunning_ = true;
            m_pReadThread_ = std::unique_ptr<std::thread>(new std::thread(&H265Reader::ThreadRead,this));
            return true;
        }
        void H265Reader::ThreadRead()
        {
            AVFormatContext *fmt_ctx = nullptr;
            AVStream *video_stream = nullptr;
            int video_stream_idx = -1;
            AVPacket pkt;
            // 打开输入文件
            if (avformat_open_input(&fmt_ctx, m_strFileName_.c_str(), nullptr, nullptr) != 0) {
                printf("Could not open input file '%s'\n",m_strFileName_.c_str());
                return ;
            }

            // 查找视频流
            if (avformat_find_stream_info(fmt_ctx, nullptr) < 0) {
                printf("Could not find stream information\n");
                return ;
            }

            for (unsigned int i = 0; i < fmt_ctx->nb_streams; i++) {
                if (fmt_ctx->streams[i]->codecpar->codec_type == AVMEDIA_TYPE_VIDEO) {
                    video_stream_idx = i;
                    video_stream = fmt_ctx->streams[i];
                    break;
                }
            }

            if (video_stream_idx == -1 || video_stream == nullptr) {
                printf("Could not find video stream\n");
                return ;
            }
            while (av_read_frame(fmt_ctx, &pkt) >= 0 && m_bRunning_) {
                if (pkt.stream_index == video_stream_idx) 
                {
                    // std::cout<<"get one frame \n";
                    if(read_callback_ != nullptr)
                    {
                        read_callback_(pkt.data,pkt.size);
                    }
                }
            }            
        }
    }
}