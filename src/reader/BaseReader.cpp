#include "BaseReader.h"
namespace deva
{
    namespace mos
    {
        BaseReader::BaseReader()
        {
            m_strFileName_ = "";
            m_bRunning_ = false;
            m_iFileType = -1;
        }
        BaseReader::~BaseReader()
        {
            m_strFileName_ = "";
            m_iFileType = -1;
            m_bRunning_ = false;
            
        }
        bool BaseReader::OpenFile(const std::string &fileName , std::function<void(const uint8_t* ,const  int &)> callback)
        {
            read_callback_ = callback;
            m_strFileName_ = fileName;
            m_iFileType = GetFileType();
            return false;
        }
        int BaseReader::GetFileType()
        {
            if(m_strFileName_.find("db3") != std::string::npos)
            {
                return 1;
            }
            if(m_strFileName_.find("mcap") != std::string::npos)
            {
                return 2;
            }
            if(m_strFileName_.find("h264") != std::string::npos)
            {
                return 3;
            }
            if(m_strFileName_.find("h265") != std::string::npos)
            {
                return 4;
            }
            return 0;
        }
    }
}