# 2023 iThome 鐵人賽
在學校的程式相關課程中(資料結構、演算法、物件導向、C/C++程式設計 ...)，都沒有使用過Github裡面的開源專案來協助開發，直到大三開始製作實務專題時才首次接觸到，接下來去公司實習、進實驗室接計畫，也經常需要使用到開源專案，但是其軟體規模通常都非常大，也依賴了許多其他第三方的程式庫，這時候就需要使用到CMake來幫助我們管理專案。

在學習CMake的過程中，找到了以下比較有架構與體系、參考價值的資源，其他的基本上都太過於零碎而難以了解全貌。

線上資源：
1. [CMake Tutorial](https://cmake.org/cmake/help/latest/guide/tutorial/index.html)
2. [CMake 入門 維基教科書](https://zh.wikibooks.org/wiki/CMake_%E5%85%A5%E9%96%80)

書籍：
1. [Cmake 實踐](http://file.ncnynl.com/ros/CMake%20Practice.pdf)
2. [程序員的自我修養 鏈接、裝載與庫](https://www.books.com.tw/products/CN10136992)
3. [CMake菜譜（CMake Cookbook中文版）](https://www.bookstack.cn/books/CMake-Cookbook)

但是在學習過程中，仍然有許多疑問是這些書籍或教程沒辦法解答的，網路上也搜尋不太到相關的範例(可能是我Google能力太爛)，例如說動態庫的版本號，沒有一個範例和我說要如何更新才能實現多版本共存或使用指定版本編譯，但這個功能在軟體實作上卻非常重要，因為第三方函式庫會一直更新，很容易陷入[相依性地獄中](https://zh.wikipedia.org/zh-tw/%E7%9B%B8%E4%BE%9D%E6%80%A7%E5%9C%B0%E7%8B%B1)。

因此這個旅程將以開發專案的視角來學習CMake，但是內容將不僅限於CMake的使用，我也會分享在開發專案過程中所遇到的問題與解決方案，順便還一下以前欠下的[知識債（Knowledge Debt)](https://medium.com/10x-curiosity/knowledge-debt-356da17818e2)。

接下來是我預計要撰寫的章節介紹
-  [**第零章 環境介紹**](https://ithelp.ithome.com.tw/articles/10319560)
-  **第一章 編譯流程** ： 簡介預處理 (pre-processing)、編譯 (compilation)、彙編 (assembly) 與鏈接 (linking)的流程。
    
-  **第二章 編譯單一原始碼**
    - 2.1. **編譯單一原始碼** ： 使用 g++ 與 make編譯單一原始碼後，說明g++、make和CMake 之間的關係。
    - 2.2. **第一個CMake專案**： 在了解過反人類的Makefile語法後，說明CMake的簡單易懂。
    
- **第三章 編譯多檔案**
    - 3.1. **編譯多檔案**：要編譯多檔案就必須要知道鏈接(Linking)的原理和語法，雖然在第一篇中有說明過，但是在這裡要重點強調。

    - 3.2. **重複定義問題**：在使用多檔案時必須使用define Guard，否則會遇到重複定義問題，因此這篇會說明原理。

    - 3.3. **定義與宣告—多檔案共用變數**：要在多檔案間共用變數需要關鍵字extern，但是本篇會將重點放在extern的實現原理：定義與宣告的差異。

    - 3.4. **多檔案的檔案架構**：將檔案使用不同資料夾分門別類放好build, include, src ...。

- **第四章 庫**
    - 4.1. **動態與靜態鍊結庫**：說明彼此的不同，以及為何要使用庫，並強調現代專案為何都使用動態庫的原因。
    
    - 4.2. **庫的實際使用經驗**：會分享實際上要如何在專案中使用別人的庫來建構專案，內容是在公司實習時廠商提供的CAN BUS Driver程式庫。

    - 4.3. **版本號**：以CAN BUS Driver為例，介紹動態庫的版本號是如何實現的原理，怎麼使用軟鍊結管理不同版本，以及各版本之間的兼容性原理-ABI二進制接口。
    
    - 4.4. **實際操作版本號**：會從編譯出帶版本號軟鍊結的動態庫，接下來會有實際範例依序更新patch, minor, major，過程中會強調什麼樣的操作會造成兼容性問題。
    - 4.5. **版本號的宏定義**：如何使用.h.in參數檔讓CMake產生宏(Marco)。
    - 4.6. **庫的安裝方式**：會介紹兩種安裝方式，一種是直接安裝在專案內部，另外一種是安裝到系統目錄下。
    
    - 4.7. **解除安裝庫**：有二種方式，第一種是手動解除安裝，第二種是編寫cmake命令。
    
    - 4.8. **包管理器**：會介紹Linux的包管理器與如何將自己的庫打包成安裝檔。
    
    - 4.9. **動態庫的兼容性**：使用ABI Checker來檢測二進制接口是否損壞，來保證庫的向後兼容性。
- **第五章 使用第三方庫**
    - 5.1. **使用第三方庫**：會介紹find_package()是如何找到別的第三方庫。
    - 5.2. **製作第三方庫**：會介紹如何讓別的專案能夠搜尋到自己的專案。
- **第六章 測試專案**
    - 6.1. **自動化測試**：使用do_test()讓專案在建構完成後，能夠自我測試功能。
    - 6.2. **GBD介紹**：簡單介紹GDB以及其必要性，並且會配合一個不能使用printf解決bug的範例。
    - 6.3. **在專案中使用GBD**：會介紹如何使用GBD這個Debugger，怎麼產生符號表，以及跨檔案行號的中斷點如何使用。
- **第七章 CMake 常用語法**
    - 7.1. **指定c++標準**
    - 7.2. **if, else流程控制**：使用Tutorial的範例讓使用者選擇是否使用自己編寫的函式庫。
    - 7.3. **if, else跨平台範例**
    - 7.4. **for 迴圈控制**：使用編譯一整個資料夾來說明for語法。
    - 7.5. **target與非target的差別**：講解在CMake官方文件中都建議使用者用target令的原因。
    - 7.6. **統整CMake產生的預定義變量**
- 其他（不確定要不要放）
    - cmake build vs make cmake install vs make install
    - cmake vs make ： [cmake --build, --install, --target package vs make, make install, make package]
    - 透過-S分析程式碼
    - 構建系統make, nijia etc.
    - #define Guard vs #pragma once
    - CMake GUI
    - #include <filename> 與 #include “filename”的差異

## 執行環境說明
### 作業系統
**[ubuntu](https://ubuntu.com/) 22.04**，Linux的任一發行版本應該都行。
雖然CMake的主要功能之一是可以跨平台開發，但是目前我還沒有這方面的經驗，因此本系列不會介紹到跨平台的功能，有此需求的話可以參考[30 天 CMake 跨平台之旅](https://ithelp.ithome.com.tw/m/users/20161950/ironman/6278)。

![https://ithelp.ithome.com.tw/upload/images/20230916/20162026rvgQ8Rmw4Q.png =400x400](https://ithelp.ithome.com.tw/upload/images/20230916/20162026rvgQ8Rmw4Q.png)


### GNU 編譯器

**[g++](https://shengyu7697.github.io/ubuntu-gcc/)** : C++編譯器
```
kai@esoc:~$ g++ --version
g++ (Ubuntu 11.4.0-1ubuntu1~22.04) 11.4.0
Copyright (C) 2021 Free Software Foundation, Inc.
This is free software; see the source for copying conditions.  There is NO
warranty; not even for MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.
```
### 編譯工具程式
**[GNU Make](https://www.cyberithub.com/how-to-install-make-command-on-ubuntu-20-04-lts-focal-fossa/) 4.3** : C/C++編譯腳本工具程式
```
kai@esoc:~$ make --version
GNU Make 4.3
Built for x86_64-pc-linux-gnu
Copyright (C) 1988-2020 Free Software Foundation, Inc.
License GPLv3+: GNU GPL version 3 or later <http://gnu.org/licenses/gpl.html>
This is free software: you are free to change and redistribute it.
There is NO WARRANTY, to the extent permitted by law.
```
**[CMake](https://www.cyberithub.com/how-to-install-cmake-on-ubuntu-20-04-lts-focal-fossa/) 3.22.1** : 在本系列是產生makefile的工具程式
```
kai@esoc:~$ cmake --version
cmake version 3.22.1

CMake suite maintained and supported by Kitware (kitware.com/cmake).

```
### IDE
**[Visual Studio Code](https://code.visualstudio.com/download)** : 有很多好用的插件，最重要的是有GitHub Copilot。
[How to Enable github copilot for free to students](https://dev.to/twizelissa/how-to-enable-github-copilot-for-free-as-student-4kal)