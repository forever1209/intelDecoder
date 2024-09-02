#include <iostream>
#include "manager.h"
int main(int argc, char * argv[])
{
    if(argc <= 1)
    {
        std::cout<<"please input h265 file . \n";
        return 0;
    }
    std::string l_strFileName = argv[1];
    std::cout<<" open file name is "<<l_strFileName<<std::endl;
    std::unique_ptr<mach::tool::Manager> m_pManager = std::unique_ptr<mach::tool::Manager>(new mach::tool::Manager(l_strFileName));
    m_pManager->OpenAndDecode();
    while (m_pManager->GetStatus() == true)
    {
         std::this_thread::sleep_for(std::chrono::milliseconds(100));
    }
    
    return 0;
}