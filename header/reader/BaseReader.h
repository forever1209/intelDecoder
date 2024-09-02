//
// Created by liulei on 2024.07.31.
//
#ifndef BASE_READER_H
#define BASE_READER_H
#include <iostream>
#include <functional>
#include <thread>
#include <memory>
namespace deva
{
    namespace mos
    {
        class BaseReader
        {
        public:
            BaseReader();
            virtual ~BaseReader();
            virtual bool OpenFile(const std::string &fileName , std::function<void(const uint8_t* ,const  int &)> callback = nullptr);
        protected:
            virtual bool Open() = 0;
        private:
            virtual int GetFileType();
        private:
        protected:
            int m_iFileType = -1;
            std::string m_strFileName_ = "";
            bool m_bRunning_ = false;
            std::function<void(const uint8_t* ,const  int &)> read_callback_ = nullptr;
        };
    } // namespace mos
    
} // namespace deva

#endif //BASE_READER_H