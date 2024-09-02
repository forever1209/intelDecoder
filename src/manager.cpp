#include "manager.h"
#include <stdexcept>
#include <unistd.h>
#include "H265Reader.h"
#include "yaml-cpp/yaml.h"
namespace mach
{
    namespace tool
    {
        const std::string GetExeRunPath()
        {
            char *p = NULL;
            const int len = 1024;
            /// to keep the absolute path of executable's path
            char l_pExecutionPath[len];
            memset(l_pExecutionPath, 0, len);
            int n = readlink("/proc/self/exe", l_pExecutionPath, len);
            if (NULL != (p = strrchr(l_pExecutionPath,'/')))
            {
                *p = '\0';
            }
            /******************************************/
            return  l_pExecutionPath;

        }

        Manager::Manager(const std::string & fileName)
        {
            m_bStatus = true;
            m_strFileName_ = fileName;
            m_strDeviceName_ = "";
            m_stFrameType_ = "";
            m_pDecoder_ = nullptr;
            GetConfigInfo();
        }
        Manager::~Manager()
        {
            m_bStatus = false;
            m_bSaveTest_ = false;
            m_pDecoder_ = nullptr;
            std::cout<<"release manager \n";
        }
        bool Manager::GetStatus() const
        {
            return m_bStatus;
        }
        void Manager::OpenAndDecode()
        {
            if(Open() == false)
            {
                std::cerr<<" open "<< m_strFileName_ <<" failed \n ";
                return;
            }
            if(m_stFrameType_.find("h264") != std::string::npos)
            {
                m_pDecoder_ = std::unique_ptr<deva::mos::MachDecoder>(new deva::mos::MachDecoder(deva::mos::CODE_TYPE_H264 , m_strDeviceName_ , m_bSaveTest_));
            }
            if(m_stFrameType_.find("h265") != std::string::npos)
            {
                m_pDecoder_ = std::unique_ptr<deva::mos::MachDecoder>(new deva::mos::MachDecoder(deva::mos::CODE_TYPE_H265 , m_strDeviceName_ , m_bSaveTest_));
            }
        }
        bool Manager::Open()
        {
            try
            {
                bool l_bOpened = false;
                m_pReader_ = std::unique_ptr<deva::mos::BaseReader>(new deva::mos::H265Reader());
                l_bOpened = m_pReader_->OpenFile(m_strFileName_ , std::bind(&Manager::FrameInfoCallBack,this,std::placeholders::_1,std::placeholders::_2));
                if(l_bOpened == false)
                {
                    throw std::runtime_error("all decoder open failed");
                }
            }
            catch(const std::exception& e)
            {
                std::cerr << e.what() << '\n';
                return false;
            }
            return true;
        }
        void Manager::Decode(const uint8_t* data,const  int &size)
        {
            if(m_pDecoder_ != nullptr)
            {
                auto begin = std::chrono::steady_clock::now();
                cv::Mat image;
                m_pDecoder_->DecodeOneFrame(data,size,image);
                auto end = std::chrono::steady_clock::now();
                std::cout << "decode and trans need : " <<std::chrono::duration<double, std::milli>(end - begin).count() <<" ms"<< std::endl;
            }
        }
        void Manager::FrameInfoCallBack(const uint8_t *data, const int &size)
        {
            Decode(data,size);
        }
        bool Manager::GetConfigInfo()
        {
            std::string l_strConfigPath = GetExeRunPath() + "/" + "config/decoder.yaml";
            YAML::Node config_root;
            try{
                config_root = YAML::LoadFile(l_strConfigPath);
                // 解析 "device" 列表
                if (config_root["device"]) {
                    for (const auto& device : config_root["device"]) {
                        m_strDeviceName_ = device.as<std::string>();
                        std::cout << "Device: " << device.as<std::string>() << std::endl;
                    }
                }

                // 解析 "frame_type" 列表
                if (config_root["frame_type"]) {
                    for (const auto& frame_type : config_root["frame_type"]) {
                        m_stFrameType_ = frame_type.as<std::string>();
                        std::cout << "Frame Type: " << frame_type.as<std::string>() << std::endl;
                    }
                }
                // 解析 "frame_type" 列表
                if (config_root["test_save"]) {
                    for (const auto& save : config_root["test_save"]) {
                        m_bSaveTest_ = save.as<bool>();
                    }
                }
                } 
            catch(YAML::BadFile &e) {
                std::cout<<"read error!"<<std::endl;
                return false;
            }
            return true;
        }
    }
}