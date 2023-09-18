## Make
### Make簡介
在軟體開發中，make 是一個工具程式，經由讀取一個叫做 Makefile 的檔案，自動化建構C/C++軟體。

編譯小型程式可在終端機使用命令編譯，或是使用 shell script 編譯，但當程式規模很大且包含大量標頭檔和函式庫，需要管理其中複雜的依賴關係時，使用 Makefile 會方便許多。

makefile 會將程式分成好幾個模組，根據裡面的目標 (target)、規則 (rule) 和檔案的修改時間進行判斷哪些需要重新編譯，可以省去大量重複編譯的時間，這在大型程式中尤為有用。
### Make 的工作流程
1. make 會在當前目錄下按順序找尋文件名為 GNUmakefile、makefile 或 Makefile 的文件。
2. 根據Makefile中定義的規則，使用編譯器套件(GNU Compiler Collections)會調用g++來編譯成最終的執行檔。
### 範例
- 先進入目標資料夾
> $ cd Day4/make
- 檔案結構
```
├── main.cpp
└── Makefile
```
- makefile內容:
```cmake
main:
```

- 編譯與執行
> $ make
> $ ./main

![https://ithelp.ithome.com.tw/upload/images/20230918/20162026Aqd6Qo5WHf.png](https://ithelp.ithome.com.tw/upload/images/20230918/20162026Aqd6Qo5WHf.png)
可以看到make調用了g++，生成了執行檔。

這樣看起來makefile還滿簡單的阿，除了有跨平台的需求之外，為什麼需要使用CMake呢？
我們先看一下 GNU make 網站的範例 [Appendix C Complex Makefile Example](https://www.gnu.org/software/make/manual/make.html#Complex-Makefile)。
```cmake
# 節錄部份
.PHONY: dist
dist: $(SRCS) $(AUX)
        echo tar-`sed \
             -e '/version_string/!d' \
             -e 's/[^0-9.]*\([0-9.]*\).*/\1/' \
             -e q
             version.c` > .fname
        -rm -rf `cat .fname`
        mkdir `cat .fname`
        ln $(SRCS) $(AUX) `cat .fname`
        tar chZf `cat .fname`.tar.Z `cat .fname`
        -rm -rf `cat .fname` .fname

tar.zoo: $(SRCS) $(AUX)
        -rm -rf tmp.dir
        -mkdir tmp.dir
        -rm tar.zoo
        for X in $(SRCS) $(AUX) ; do \
            echo $$X ; \
            sed 's/$$/^M/' $$X \
            > tmp.dir/$$X ; done
        cd tmp.dir ; zoo aM ../tar.zoo *
        -rm -rf tmp.dir
```
可以發現，裡面有一堆奇怪的亂碼與Linux sheel script。
當然，那些看起來像亂碼的符號其實是makefile的各種自動化變量，但學習Makefile更困難的是他的各種規則，尤其是[隱含規則](https://seisman.github.io/how-to-write-makefile/implicit_rules.html)。
因此現在要建構一個C/C++專案一個更好的選擇是CMake，CMake的語法相對於Makefile容易理解許多。
## [CMake](https://cmake.org/)
CMake 是一個開源、跨平台的軟體工具系列，用於構建、測試和打包專案, 並使用簡單的平台和獨立於編譯器的配置文件來控制軟件編譯過程，且能夠自行選擇編譯器環境與平台。
### g++、make和CMake 關係簡介
g++將源文件編譯（Compile）成可執行文件或者庫文件；

而當需要編譯的東西很多時，需要說明先編譯什麼，後編譯什麼，這個過程稱為構建（Build）。常用的工具是make，對應的定義構建過程的文件為Makefile；

而編寫Makefile對於大型項目又比較複雜(裡面有一大堆規則，尤其是隱式規則，並不好理解)，通過CMake就可以使用更加簡潔的語法定義構建的流程，並且可以輕易地根據所在平台(Linux or windows or others)指定編譯方式。
CMake定義構建過程的文件為CMakeLists.txt。
以下是CMake的工作流程：
- CMake讀取CMakeLists.txt後生成Makefile
- Make讀取Makefile後使用g++編譯出最終的執行檔

![https://ithelp.ithome.com.tw/upload/images/20230918/20162026prFjMp2W3F.png](https://ithelp.ithome.com.tw/upload/images/20230918/20162026prFjMp2W3F.png)



明天就會開始建構我們的第一個CMake專案啦!



## Refenence
[CMake](https://cmake.org/)
[Difference between GCC and G++](https://www.geeksforgeeks.org/difference-between-gcc-and-g/)