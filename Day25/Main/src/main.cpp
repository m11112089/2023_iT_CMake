#include <iostream>
#include <glog/logging.h>

int main(int argc, char* argv[])
{
  google::InitGoogleLogging(argv[0]);
  // 初始化glog库
  FLAGS_logtostderr = 1;
  // 設定日誌輸出到終端上
  LOG(INFO) << "Hello, World!";
  // 輸出日誌
  return 0;
} 