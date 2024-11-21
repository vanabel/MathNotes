### LaTeX 基础
#### LaTeX 的简介与安装
##### 简介
* TeX 是高德纳 (Donald E. Knuth) 为排版文字和数学公式而开发的, 一个高质量的排版系统，尤其适用于生成复杂的文档如学术论文和书籍。
* TEX 读作“Tech”，与汉字“泰赫”的发音相近，其中“ch”的发音类似于“h”。
* TeX 可以通过命令行工具和编辑器进行高效编写和编译文档。
* LATEX 是一种使用 TEX 程序作为排版引擎的格式(format)，可以粗略地将它理解成是对 TEX 的一层封装。
* LATEX 2ε 是 LATEX 的当前版本，意思是超出了第二版，但还远未达到第三版，在 ASCII 字符环境写作 LaTeX2e。
* 支持在线编译：[OverLeaf](https://www.overleaf.com)
##### 优缺点
* 具有专业的排版输出能力，产生的文档看上去就像“印刷品”一样。
* 具有方便而强大的数学公式排版能力
* 绝大多数时候，用户只需专注于一些组织文档结构的基础命令，无需(或很少)操心文档 的版面设计。
* 很容易生成复杂的专业排版元素，如脚注、交叉引用、参考文献、目录等。
* 强大的可扩展性。世界各地的人开发了数以千计的 LATEX 宏包用于补充和扩展 LATEX 的功 能。
* 跨平台、免费、开源。
----
*  入门门槛高。
* 不容易排查错误。
* 不容易定制样式。
* 非“所见即所得”。
##### 安装
* 下载并安装[MiKTeX](https://miktex.org/download)或者[CTeX](https://ctex.org/ctex/download/)
* 安装编辑器（如[WinEdt](https://www.winedt.com)、TeXworks(自带)、[TeXstudio](https://www.texstudio.org)
* 通过MiKTeX Console更新并管理包

> 注意事项:
>* 选择合适的发行版（MiKTeX或TeX Live）
>* 确保编辑器（如TeXworks、TeXstudio）兼容
>* 安装路径注意权限问题
>* 定期使用MiKTeX Console或TeX Live Manager更新包
###### Linux
* 使用包管理器安装TeX Live: `sudo apt-get install texlive`
* 安装编辑器（如[Vim](https://www.vim.org)、[VS Code](https://code.visualstudio.com/download)、TeXmaker、[Kile](https://kile.sourceforge.io)
* 更新TeX Live包：`tlmgr update --self --all`

> 注意事项:
> * 使用系统包管理器安装TeX Live
> * 配置环境变量以便命令行调用
> * 安装额外字体和语言包（如`texlive-lang-chinese`)
> * 选择合适的编译器（如`pdflatex`、`xelatex`、`lualatex`）

###### Mac
* 下载并安装[MacTeX](https://tug.org/mactex/)
* 安装编辑器（如[Vim](https://www.vim.org)、[VS Code](https://code.visualstudio.com/download)、TeXShop）
* 使用TeX Live Utility进行包管理和更新

> 注意事项:
> * 从官网下载MacTeX
> * 确保系统兼容性
> * 使用TeX Live Utility管理和更新包
> * 安装过程可能需要管理员权限
> * 选择合适的编辑器（如TeXShop、[Sublime Text](https://www.sublimetext.com)、[VS Code](https://code.visualstudio.com/download)）

#### 首次使用
选择你喜欢的编辑器，例如TeXworks或者TeXstudio，输入一下代码：
```tex
\documentclass{article}
\begin{document}
``Hello world!'' from \LaTeX.
\end{document}
```
然后再选择一种编译引擎，例如PDFLaTeX或者XeLaTeX，编译即可得到PDF文件。
#### LATEX 命令和代码结构
##### 命令
LATEX 中命令以反斜线 `\`开头，为以下两种形式之一:
* 反斜线和后面的一串字母，如 `\LaTeX`。它们以任意非字母符号(空格、数字、标点等)为 界限。
* 反斜线和后面的单个非字母符号，如 `\$`。

> 要注意 LATEX 命令是对**大小写敏感**的。

* 字母形式的 LATEX 命令忽略其后的所有连续空格。如果要人为引入空格，需要在命令后面 加一对花括号阻止其忽略空格：
  ```tex
  Shall we call ourselves \TeX users or \TeX{} users?
  ```
* 有些 LATEX 命令可以接收一些参数:
  * 可选参数: 以方括号`[`和`]`包裹
  * 必选参数: 以花括号`{`和`}`包裹
* 有些命令可以带一个星号`*`. 星号看作一种特殊的可选参数。
##### 环境
LATEX中还包括环境，用以令一些效果在局部生效，或是生成特殊的文档元素。LATEX 环境的用法为一对命令`\begin`和`\end`:
```tex
\begin{⟨environment name⟩}[⟨optional arguments⟩]{⟨mandatory arguments⟩} 
  ...
\end{⟨environment name⟩}
```
##### 分组
* 有些命令(如`\bfseries`)会对其后所有内容产生作用。若要限制其作用范围，则需要使用**分组**。
* LATEX 使用一对花括号`{`和`}`作为分组，在分组中使用的命令被限制在分组内，不会影响到分组外的内容。
* 上文提到的 LATEX 环境隐含了一个分组，在环境中的命令被包裹在分组内。
##### LATEX 源代码结构
```tex
\documentclass{...} % ... 为某文档类 
% 导言区
\begin{document}
% 正文内容
\end{document}
% 此后内容会被忽略
```
* LATEX 源代码以一个`\documentclass`命令作为开头，它指定了文档使用的**文档类**。
* `document`环境当中的内容是**文档正文**。
* 在`\documentclass`和`\begin{document}`之间的位置称为**导言区**。
* 在导言区中常会使用`\usepackage`命令调用**宏包**，还会进行文档的全局设置。
#### LATEX 宏包和文档类
##### 文档类
* 文档类规定了 LATEX 源代码所要生成的文档的性质——普通文章(`article`)、书籍(`book`)、演示文稿(`report`/`beamer`/`slides`)、个人简
历(`moderncv`)等等。
* 对应的中文版文档类为: `ctexart`、`ctexbook`、`ctexrep`。
* `minimal`文档类一般用于代码测试的最小工作示例。
* 文档类包括可选参数，它全局地规定一些排版的参数。
  ```tex
  \documentclass[11pt,twoside,a4paper]{article}
  ```
  LATEX 的三个标准文档类包括：
  * 字号：`10pt`, `11pt`, `12pt`
  * 纸张大小: `a4paper`, `a3paper`, `b5paper`, `letterpaper`
  * 单面/双面排版: `twoside`,` oneside`
  * 单栏/双栏排版: `onecolumn`, `twocolumn`
  * 横向排版: `landscape`
  * 草稿/终稿模式: `draft`, `final`
##### 宏包
  在使用 LATEX 时，时常需要依赖一些扩展来增强或补充 LATEX 的功能，比如排版复杂的表 格、插入图片、增加颜色甚至超链接等等。这些扩展称为**宏包**。调用宏包的方法非常类似调用文档类的方法:
  ```tex
  \usepackage[⟨options⟩]{⟨package-name⟩}
  ```
  * 使用`texdoc <pkg-name>`查阅相应文档
#### LATEX 用到的文件一览
除了源代码文件`.tex`以外，我们在使用 LATEX 时还可能接触到各种格式的文件。
* `.sty` 宏包文件。宏包的名称与文件名一致。
* `.cls` 文档类文件。文档类名称与文件名一致。
* `.bib` BIBTEX 参考文献数据库文件。
* `.bst` BIBTEX 用到的参考文献格式模板。
---
LATEX 在编译过程中除了生成`.dvi`或`.pdf`格式的文档外，还可能会生成相当多的辅助文件和日志。
`.log` 排版引擎生成的日志文件，供排查错误使用。
`.aux` LATEX 生成的主辅助文件，记录交叉引用、目录、参考文献的引用等。 .toc LATEX 生成的目录记录文件。
`.lof` LATEX 生成的图片目录记录文件。
`.lot` LATEX 生成的表格目录记录文件。
`.bbl` BIBTEX 生成的参考文献记录文件。
`.blg` BIBTEX 生成的日志文件。
`.idx` LATEX 生成的供 makeindex 处理的索引记录文件。
`.ind` makeindex 处理 .idx 生成的用于排版的格式化索引文件。
`.ilg` makeindex 生成的日志文件。
`.out` hyperref 宏包生成的 PDF 书签记录文件。
#### 文件的组织方式
当编写长篇文档时，例如当编写书籍、毕业论文时，单个源文件会使修改、校对变得十分困难。将源文件分割成若干个文件，例如将每章内容单独写在一个文件中，会大大简化修改和校对的工作。
LATEX 提供了命令`\include`/`\input`用来在源代码里插入文件: 
```tex
\include{⟨filename⟩} %.tex后缀不要写
\include{chapters/file} % 相对路径
\include{/home/Bob/file} % *nix(包含 Linux、macOS)绝对路径
\include{D:/file} % Windows 绝对路径，用正斜线
\input{⟨filename⟩} % 不另起一页
```
> * 当导言区内容较多时，常常将其单独放置在一个`.tex`文件中，再用`\input`命令插入。复杂的图、表、代码等也会用类似的手段处理。
> * 使用`\include`和`\input`命令载入的文件名最好不要加空格和特殊字符， 也尽量避免使用中文名，否则很可能会出错。
> * 可以在**导言区**使用`\includeonly`来指定正文中需要载入的`\include`文件列表，不再列表中的文件将不起作用。这在书籍类文档写作时非常有用，可以加快编译。

最后介绍一个实用的工具宏包**syntonly**。加载这个宏包后，在导言区使用`\syntaxonly`命令，可令 `LATEX` 编译后不生成 `DVI` 或者 `PDF` 文档，只排查错误，编译速度会快不少:
```tex
\usepackage{syntonly}
\syntaxonly
```
如果想生成文档，则用 `%` 注释掉 `\syntaxonly` 命令即可。
#### `LATEX` 和 `TEX` 相关的术语和概念
* **引擎**: 全称为排版引擎，是编译源代码并生成文档的程序，如 `pdfTEX`、`XƎTEX` 等。有时也称为 **编译器**。
* **格式**: 是定义了一组命令的代码集。`LATEX` 就是最广泛应用的一个格式，高德纳本人还编写了一个简单的 `plain TEX` 格式，没有定义诸如 `\documentclass` 和 `\section` 等等命令。
* **编译命令**: 是实际调用的、结合了引擎和格式的命令。如 `xelatex` 命令是结合 `XƎTEX` 引擎和 `LATEX` 格式的一个编译命令。
### 用 `LATEX` 排版文字
#### 语言文字和编码
* `LATEX` 源代码为文本文件，而文本文件的一个至关重要的性质是它的编码。常见的编码有`ASCII`、 `Latin-1`(西欧)、`GB 2312`(简体)、`GBK`(繁体)、`UTF-8`（所有语言）。
* 早期排版中文须使用 `CJK` 宏包，它是一个用于处理中、日、韩等东亚语言文字编码和字体配置的宏包。**但 `CJK` 宏包的使用非常不方便，目前已不再推荐直接使用。**
* 现行版本的 `LATEX` 使用 `UTF-8` 作为默认编码。将使用拉丁字母的文档保存为 `UTF-8` 编码 后，可以用 `pdflatex` 直接编译，比如:
  ```tex
  \documentclass{article}
  \begin{document}
  Français Português Español Føroyskt
  \end{document}
  ```
* 较为现代的 `TEX` 引擎，如 `XƎTEX` 和 `LuaTEX`，它们均原生支持 `UTF-8` 编码。使用 `xelatex` 和 `lualatex` 排版时，将源代码保存为 `UTF-8` 编码，并借助 `fontspec` 宏包调用适当的字体，原则上就可以在源代码中输入任意语言的文字。
  ```tex
  \documentclass{article}
  \usepackage{fontspec} % 使用 XeLaTeX 必须加载 fontspec 宏包
  \usepackage{polyglossia} % 支持多语言
  \setmainlanguage{russian} % 设置主语言为俄语
  \setotherlanguage{english} % 如果需要，也可以添加其他语言
  
  % 设置字体 (可以换成系统安装的其他支持西里尔字母的字体)
  \newfontfamily\russianfont{Times New Roman}
  \newfontfamily\englishfont{Times New Roman}
  
  \begin{document}
  
  % 示例俄文内容
  \section*{Пример}
  Привет, мир! Это пример текста на русском языке.
  
  % 如果需要英文内容
  \section*{Example}
  Hello, world! This is an example of text in English.
  
  \end{document}
  ```
#### 排版中文
* 用 `LATEX` 排版中文需要解决两方面问题，一方面是对中文字体的支持，另一方面是对中文排版中的一些细节的处理，包括在汉字之间控制断行、标点符号的禁则(如句号、逗号不允许出现在行首)、中英文之间插入间距等。
> `CJK` 宏包对中文字体的支持比较麻烦，已经不再推荐直接使用。(但是很遗憾，国内非常多的杂志模版还是使用的`CJK`)
* `XƎTEX` 和 `LuaTEX` 除了直接支持 `UTF-8` 编码外，还支持直接调用 `TrueType`/`OpenType` 格式的字体。`xeCJK` 及 `luatexja` 宏包则在此基础上封装了对汉字排版细节的处理功能。
* `ctex` 宏包和文档类进一步封装了 `CJK`、`xeCJK`、`luatexja` 等宏包，使得用户在排版中文时不用再考虑排版引擎等细节。
* `ctex` 宏包和文档类能够识别操作系统和 `TEX` 发行版中安装的中文字体，因此基本无需额外配置即可排版中文文档。
* `ctex` 宏包本身用于配合各种文档类排版中文，而 `ctex` 文档类对 `LATEX` 的标准文档类进行了封装，对一些排版根据中文排版习惯做了调整，包括 `ctexart`、`ctexrep`、 `ctexbook` 等。
  ```tex
  \documentclass{ctexart}
  \begin{document}
  在\LaTeX{}中排版中文。 汉字和English单词混排，
  通常不需要在中英文之间添加额外的空格。 
  当然，为了代码的可读性，加上汉字和 English 之间的空格也无妨。 
  汉字换行时不会引入多余的空格。
  \end{document}
  ```
注意源代码须保存为 `UTF-8` 编码，并使用 `xelatex` 或 `lualatex` 命令编译。
#### `LATEX` 中的字符
* **空格和分段**: **空格键**和 **Tab 键**输入的空白字符视为“空格”。连续的若干个空白字符视为一个空格。一行开头的空格忽略不计。
行末的换行符视为一个空格; 但连续两个换行符，也就是空行，会将文字分段。多个空行被视为一个空行。也可以在行末使用 `\par` 命令分段。
* **注释**: `LATEX` 用 % 字符作为注释。在这个字符之后直到行末，所有的字符都被忽略，行末的换行符也不引入空格。
* **特殊字符**: 以下字符在 LATEX 里有特殊用途, `#`, `$, `%`, `&`, `{`, `}`, `_`, `^`, `~`, `\`. 如果想要输入以上符号，需要使用以下带反斜线的形式输入，类似编程语言里的“转义”符号:
  ```tex
  \# \$ \% \& \{ \} \_ \^{} \~{} \textbackslash
  ```
* **连字**(ligatures): 西文排版中经常会出现连字(ligatures)，常见的有 ff/fi/fl/ffi/ffl。可以通过`{}`打断连字：`dif{}f{}icult`, `f{}ind`
* **标点符号** 
  * **引号**: `LATEX` 中单引号 `‘` 和 `’` 分别用 `` ` `` 和 `'` 输入; 双引号 `“` 和 `”` 分别用 ``` ``  ``` 和 `''` 输入。中文的引号`‘ ’`和`“ ”`与西文的引号实际上是同一组符号。在使用 ctex 宏包或文档类的情况下，中文引号可以通过输入法直接输入。
  * **连字号和破折号**: `LATEX` 中有三种长度的“横线”可用:
    连字号(hyphen)、短破折号(en-dash)和长破折号 (em-dash)。
    它们分别有不同的用途:
    * 连字号 `-` 用来组成复合词;
    * 短破折号 `--` 用来连接数字表示范围;
    * 长破折号 `---` 用来连接单词，语义上类似中文的破折号。
    ```tex 
     daughter-in-law, X-rated\\
     pages 13--67\\
     yes---or no?
    ```
  * **省略号**: LATEX 提供了 `\ldots` 命令表示省略号
  * **波浪号**: 西文中较少将波浪号作为标点符号使用，在中文环境中一般直接使用全角波浪号(~)。
* **拉丁文扩展与重音**: LATEX 支持用命令输入西欧语言中使用的各种拉丁文扩展字符，主要为带重音的字母
  ```tex
  H\^otel, na\"\i ve, \'el\`eve,\\
  sm\o rrebr\o d, !`Se\ norita!,\\
  Sch\"onbrunner Schlo\ss{}
  Stra\ss e
  ```
  效果为：
  ```txt
  Hôtel, naïve, élève, 
  smørrebrød, ¡Se norita!, 
  Schönbrunner Schloß Straße
  ```
  ![[重音符号表.png]]
* **其它符号**: LATEX 预定义了其它一些文本模式的符号，部分符号可参考: [TeX常见符号表](TeX常见符号表.pdf)
* **`LATEX` 标志**: `\TeX`、`\LaTeX`、`\LaTeXe`
#### 断行和断页
* **单词间距**: 单词之间的空白间距会根据内容自动调整。文字在单词间的“空格”处断行时，“空格”生成的间距随之舍去。我们可以使用字符 `~` 输入一个不会断行的空格(高德纳称之为 tie，“带子”)，通常用在英文人名、图表名称等上下文环境: `Fig.~2a`, `Donald~E. Knuth` .
* **手动断行**: 如果我们确实需要手动断行，可使用如下命令
  *  `\\[⟨length⟩]`: 在断行处向下增加垂直间距
  * `\\*[⟨length⟩]`: 类似，但是不在断行处分页
  * `\newline`: 不带参数。此外，`\\` 也在表格、公式等地方用于换行，而 `\newline` 只用于文本段落中
* **手动分页**: 分页的命令有两个
  * `\newpage`
  * `\clearpage`
* **断词**: 对于绝大多数单词，`LATEX` 能够找到合适的断词位置，在断开的行尾加上连字符`-`。如果一些单词没能自动断词，我们可以在单词内手动使用 `\-` 命令指定断词的位置。
### 文档元素
一个结构化的文档依赖于各种元素:章节、目录、列表、图表、交叉引用、脚注等等。
#### 章节和目录
##### 章节标题
* 常见的章节命令：`\chapter{⟨title⟩}`(章,只在 report 和 book 文档类有定义)、`\part` (部分，不影响 `\chapter` 或 `\section` 等的编号)、` \section{⟨title⟩}`(节）、 `\subsection{⟨title⟩}`(小节)、` \subsubsection{⟨title⟩}`(小小节)、`\paragraph{⟨title⟩}`(段落)、`\subparagraph{⟨title⟩}`(子段落)
* 上述命令除了生成带编号的标题之外，还向目录中添加条目，并影响页眉页脚的内容。每个命令有两种变体:
  * 带可选参数的变体:`\section[⟨short title⟩]{⟨title⟩}`. 标题使用 `⟨title⟩` 参数，在目录和页眉页脚中使用 `⟨short title⟩` 参数;
  * 带星号的变体:`\section*{⟨title⟩}` 标题不带编号，也不生成目录项和页眉页脚。
* `LATEX` 及标准文档类并未提供为 `\section` 等章节命令定制格式的功能，这一功能由 `titlesec` 宏包提供。
##### 目录
在 `LATEX` 中生成目录非常容易，只需在合适的地方使用命令: `\tableofcontents`。

有时我们使用了 `\chapter*` 或 `\section*` 这样不生成目录项的章节标题命令，而又想手动 生成该章节的目录项，可以在标题命令后面使用:
`\addcontentsline{toc}{⟨level⟩}{⟨title⟩}`
其中 `⟨level⟩` 为章节层次 `chapter` 或 `section` 等，`⟨title⟩` 为出现于目录项的章节标题。
##### 文档结构的划分
* 所有标准文档类都提供了一个 `\appendix` 命令将正文和附录分开，使用 `\appendix` 后，最 高一级章节改为使用拉丁字母编号，从 A 开始。
* `book` 文档类还提供了前言、正文、后记结构的划分命令:
  * `\frontmatter` 前言部分: 页码使用小写罗马数字; 其后的 `\chapter` 不编号。 
  * `\mainmatter` 正文部分: 页码使用阿拉伯数字，从 1 开始计数; 其后的章节编号正常。 
  * `\backmatter` 后记部分: 页码格式不变，继续正常计数;其后的 `\chapter` 不编号。
以上三个命令还可和 `\appendix` 命令结合，生成有前言、正文、附录、后记四部分的文档。
  ```tex
  %book 文档类的文档结构示例。
  \documentclass{book}

  %导言区，加载宏包和各项设置，包括参考文献、索引等
  \usepackage{makeidx} % 调用makeidx宏包，用来处理索引
  \makeindex % 开启索引的收集
  \bibliographystyle{plain} % 指定参考文献样式为 plain

  \begin{document}

  \frontmatter % 前言部分
  \maketitle % 标题页
  \include{preface} % 前言章节 preface.tex
  \tableofcontents

  \mainmatter % 正文部分
  \include{chapter1} % 第一章 chapter1.tex
  \include{chapter2} % 第二章 chapter2.tex
  ...

  \appendix % 附录
  \include{appendixA} % 附录 A appendixA.tex

  \backmatter % 后记部分
  \include{epilogue} % 后记 epilogue.tex
  \bibliography{books} % 利用BibTeX工具从数据库文件 books.bib 生成参考文献
  \printindex % 利用makeindex工具生成索引

  \end{document}
  ```
#### 标题页
* `LATEX` 支持生成简单的标题页。首先需要给定标题和作者等信息:
  ```tex
  \title{⟨title⟩} \author{⟨author ⟩} \date{⟨date⟩}
  ```
其中前两个命令是必须的(不用 `\title` 会报错;不用 `\author` 会警告)，`\date` 命令可选。使用 `\today` 命令自动生成当前日期。
* 在 `\title`、`\author` 等命令内可以使用 `\thanks` 命令生成标题页的脚注，用 `\and` 隔开多个人名。
  ```tex
  \documentclass{article}
  \title{This is a test}
  \author{San Zhang \thanks{The first author would like to thanks...}
  \and Si Li\thanks{The sencond author would like to thanks}}
  \date{\today}
  \begin{document}
  \maketitle
  \end{document}
  ```
  * 在标准文档类（`article`、`book`、`report`）可以使用`titlepage`、`notitlepage`来设置是否有单独的标题页。例如
    ```tex 
    \documentclass[titlepage]{article}
    ```
    将生成一页单独的标题页，这不是`article`默认的方式。
    * `LATEX` 标准类还提供了一个简单的 `titlepage` 环境，生成不带页眉页脚的一页。用户可以在这个环境中使用各种排版元素自由发挥，生成自定义的标题页以替代 `\maketitle` 命令。甚至 可以利用 `titlepage` 环境重新定义 `\maketitle`:
    ```tex
    \renewcommand{\maketitle}{\begin{titlepage}
    ... % 用户自定义命令
    \end{titlepage}}
    ```
