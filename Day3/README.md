# [Day 3] 編譯流程
在學習如何建構一個專案之前，必須了解編譯的各個流程，因為一個專案從原始碼階段開始到最後產生出來的執行檔，這中間經過的編譯流程需要我們自行定義CMake的指令來控制。
今天就讓我們從那個經典的 "Hello World!" 範例開始了解一個專案是如何編譯的吧!
## Sample Code
Sample Code都會放在Github上，只要克隆下來就可以了!
> $ git clone https://github.com/m11112089/2023_iT_CMake.git

> $ cd 2023_iT_CMake/Day3
## 編譯流程
這整個過程可以大致上分成四個步驟，分別為預處理 (pre-processing)、編譯 (compilation)、彙編 (assembly) 與鏈接 (linking)。
![](https://hackmd.io/_uploads/ryZbbNEJa.png)


### 預處理 (pre-processing)
在這個階段編譯器主要的工作是展開引用的外部檔案、 macro 及 define 。

1. 刪除所有的 #define 並展開所有 macro

2. 處理所有的預編譯條件，例如 #ifdef , #include ...

3. 刪除所有 註解

4. 增加 行號以及 文件識別名，讓編譯器在編譯失敗時可以顯示錯誤的行數

>**將main.cpp 預處理成 main.i**
> $ g++ -E main.cpp -o main.i

### 編譯 (compilation)
此階段編譯器會將展開後的程式碼轉換成組合語言。此階段又可以細分成四個小步驟，分別為 掃描 (scan)、語法分析 (parsing) 、語意分析 (semantic analysis) 與 源代碼優化 (source code optimization) 與 代碼生成與優化(code generation and optimization)。


>**將 main.i 編譯成 main.s**
> $ g++ -S main.i -o main.s

### 彙編 (assembly)
此步驟只是簡單的將上一步驟，編譯出的組合語言轉換成對應的機器語言，只要根據對照表翻譯即可。

>**將 main.s 彙編成 main.o**
> $ g++ -c main.s -o main.o
### 鏈接 (linking)
這個步驟是讓編譯器能夠知道原始碼中外部函數或是外部變數明確的位址 。比方說，如果我們在檔案 main.cpp 中引用了別的檔案 func.cpp 中的 foo() 函數。我們必須先知道這個函數到底在哪裡，才可以呼叫它。鏈結要做的事情，就是把多個不同的文件組合在一起，成為一個完整的整體。
因為目前只有單一檔案，練接的都是系統預設的標準庫(Standard Libraries)，我們不用自行練接，而多檔案的練接會在之後詳細講解。
![](https://miro.medium.com/max/1094/1*ef_EVqUmv1I9OckQ2Z_C5w.png =400x250)

>**將 main.o 連結到 名稱為main的執行檔**
> $ g++ main.o -o main

我們可以使用ldd指令來查看生成的執行檔練接了那一些標準庫。
> $ ldd main
```
// output
	linux-vdso.so.1 (0x00007ffe902b2000)
	libstdc++.so.6 => /lib/x86_64-linux-gnu/libstdc++.so.6 (0x00007f4928e00000)
	libc.so.6 => /lib/x86_64-linux-gnu/libc.so.6 (0x00007f4928a00000)
	libm.so.6 => /lib/x86_64-linux-gnu/libm.so.6 (0x00007f4928d19000)
	/lib64/ld-linux-x86-64.so.2 (0x00007f4929128000)
	libgcc_s.so.1 => /lib/x86_64-linux-gnu/libgcc_s.so.1 (0x00007f49290dc000)
```
### 執行(execute)
>**執行名稱為main的執行檔**
> $ ./main
### 總結流程總結
![](https://hackmd.io/_uploads/By8DmE4Ja.png)



### 因為只有一個檔案，所以也可以直接生成執行檔執行
> $ g++ main.cpp -o main
> $ ./main
> 
![](https://hackmd.io/_uploads/B13FQNVk6.png)



## Refenence
[淺談 c++ 編譯到鏈結的過程](https://medium.com/@alastor0325/https-medium-com-alastor0325-compilation-to-linking-c07121e2803)
書籍：程序員的自我修養 鏈接、裝載與庫