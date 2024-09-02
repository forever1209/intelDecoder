//
// Created by liulei on 2024.07.31.
//
#ifndef MACH_MANAGER_H
#define MACH_MANAGER_H
#include <iostream>
#include <memory>
#include <thread>
#include "BaseReader.h"
#include "decoder.h"
namespace mach
{
    namespace tool
    {
        class Manager
        {
        public:
            Manager(const std::string & fileName);
            ~Manager();
        public:
            bool GetStatus() const;
            void OpenAndDecode();
        private:
            bool Open();
            void Decode(const uint8_t* data,const  int &size);
            void FrameInfoCallBack(const uint8_t* data,const  int &size);
            bool GetConfigInfo();
        private:
            bool m_bStatus = false;
            bool m_bSaveTest_ = false;
            std::string m_strFileName_ = "";
            std::string m_strDeviceName_ = "";
            std::string m_stFrameType_ = "";
            std::unique_ptr<deva::mos::BaseReader> m_pReader_ = nullptr;
            std::unique_ptr<deva::mos::MachDecoder> m_pDecoder_ = nullptr;
        };
    } // namespace tool
    
} // namespace mach

#endif //MACH_MANAGER_H