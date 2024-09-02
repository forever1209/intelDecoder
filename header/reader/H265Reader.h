//
// Created by liulei on 2024.07.31.
//
#ifndef H265_READER_H
#define H265_READER_H
#include <iostream>
#include "BaseReader.h"
namespace deva
{
    namespace mos
    {
        class H265Reader : public BaseReader
        {
        public:
            H265Reader();
            virtual ~H265Reader();
            virtual bool OpenFile(const std::string &fileName , std::function<void(const uint8_t* ,const  int &)> callback = nullptr);
        private:
            virtual bool Open();
            void ThreadRead();
        private:
            std::unique_ptr<std::thread> m_pReadThread_ = nullptr;
        };
    }
}
#endif //H265_READER_H