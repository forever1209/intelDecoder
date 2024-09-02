//
// Created by liulei on 2024.07.31.
//
#ifndef MACH_DECODER_H
#define MACH_DECODER_H
#include <iostream>
#include <chrono>
#include <memory>
#include <string>
#include <thread>
#include <mutex>
#include <vector>
#include <functional>
extern "C" {
#include "libavutil/imgutils.h"
#include "libswscale/swscale.h"
#include "libavutil/frame.h"
#include "libavcodec/avcodec.h"
#include <libavformat/avformat.h>
}
#define DECODER_USE_OPENCV
#ifdef DECODER_USE_OPENCV
#include <opencv2/core.hpp>
#include <opencv2/opencv.hpp>
#endif
namespace deva
{
    namespace mos
    {
        #ifndef DECODER_USE_DEFINE
        #define DECODER_USE_DEFINE
        enum FrameCodeType
        {
            CODE_TYPE_H265 = 1,
            CODE_TYPE_H264 = 2,
            CODE_TYPE_DEFAULT
        };

        struct DecoderCbInfo
        {
            uint16_t width;
            uint16_t height;
            uint64_t timestamp;
            cv::Mat cv_data;
        };
        #endif

        class MachDecoder
        {
        public:
            MachDecoder(const FrameCodeType & code_type , const std::string & device , const bool & save , std::function<void(DecoderCbInfo)> callback = nullptr);
            ~MachDecoder();

        public:
            void DecodeOneFrame(const uint8_t* data,const  int &size , const uint64_t &timestamp);
            void DecodeOneFrame(const uint8_t* data,const  int &size , cv::Mat & image);
        private:
            void DecodeFrame(const uint8_t* data,const  int &size , const uint64_t &timestamp);
            void DecodeFrame(const uint8_t* data,const  int &size , cv::Mat & image);
            void InitDecoder(const std::string & device = "");
            void ConverColorSpace(AVFrame* srcFrame , cv::Mat & image);
            void SaveFrame(AVFrame *pFrame, int width, int height, int index);
        private:
            FrameCodeType frame_codec_type_ = CODE_TYPE_DEFAULT;
            AVCodec* codec_;
            AVCodecContext* codec_context_;
            AVFrame* frame_;
            AVBufferRef *device_ref ;
            uint8_t *buffer = nullptr;
            struct SwsContext *img_ctx = nullptr;
            bool m_bHardwareDecode_ = false;
            bool m_bSaveTest_ = false;
            std::function<void(DecoderCbInfo)> decode_callback = nullptr;
        };
    } // namespace mos
    
} // namespace deva


#endif //MACH_DECODER_H
