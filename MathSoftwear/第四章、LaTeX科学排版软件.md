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
```latex
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
  ```latex
  Shall we call ourselves \TeX users or \TeX{} users?
  ```
* 有些 LATEX 命令可以接收一些参数:
  * 可选参数: 以方括号`[`和`]`包裹
  * 必选参数: 以花括号`{`和`}`包裹
* 有些命令可以带一个星号`*`. 星号看作一种特殊的可选参数。
##### 环境
LATEX中还包括环境，用以令一些效果在局部生效，或是生成特殊的文档元素。LATEX 环境的用法为一对命令`\begin`和`\end`:
```latex
\begin{⟨environment name⟩}[⟨optional arguments⟩]{⟨mandatory arguments⟩} 
  ...
\end{⟨environment name⟩}
```
##### 分组
* 有些命令(如`\bfseries`)会对其后所有内容产生作用。若要限制其作用范围，则需要使用**分组**。
* LATEX 使用一对花括号`{`和`}`作为分组，在分组中使用的命令被限制在分组内，不会影响到分组外的内容。
* 上文提到的 LATEX 环境隐含了一个分组，在环境中的命令被包裹在分组内。
##### LATEX 源代码结构
```latex
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
  ```latex
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
  ```latex
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
```latex
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
```latex
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
  ```latex
  \documentclass{article}
  \begin{document}
  Français Português Español Føroyskt
  \end{document}
  ```
* 较为现代的 `TEX` 引擎，如 `XƎTEX` 和 `LuaTEX`，它们均原生支持 `UTF-8` 编码。使用 `xelatex` 和 `lualatex` 排版时，将源代码保存为 `UTF-8` 编码，并借助 `fontspec` 宏包调用适当的字体，原则上就可以在源代码中输入任意语言的文字。
  ```latex
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
  ```latex
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
  ```latex
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
    ```latex 
     daughter-in-law, X-rated\\
     pages 13--67\\
     yes---or no?
    ```
  * **省略号**: LATEX 提供了 `\ldots` 命令表示省略号
  * **波浪号**: 西文中较少将波浪号作为标点符号使用，在中文环境中一般直接使用全角波浪号(~)。
* **拉丁文扩展与重音**: LATEX 支持用命令输入西欧语言中使用的各种拉丁文扩展字符，主要为带重音的字母
  ```latex
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
  ```latex
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
  ```latex
  \title{⟨title⟩} \author{⟨author ⟩} \date{⟨date⟩}
  ```
其中前两个命令是必须的(不用 `\title` 会报错;不用 `\author` 会警告)，`\date` 命令可选。使用 `\today` 命令自动生成当前日期。
* 在 `\title`、`\author` 等命令内可以使用 `\thanks` 命令生成标题页的脚注，用 `\and` 隔开多个人名。
  ```latex
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
    ```latex 
    \documentclass[titlepage]{article}
    ```
    将生成一页单独的标题页，这不是`article`默认的方式。
    * `LATEX` 标准类还提供了一个简单的 `titlepage` 环境，生成不带页眉页脚的一页。用户可以在这个环境中使用各种排版元素自由发挥，生成自定义的标题页以替代 `\maketitle` 命令。甚至 可以利用 `titlepage` 环境重新定义 `\maketitle`:
    ```latex
    \renewcommand{\maketitle}{\begin{titlepage}
    ... % 用户自定义命令
    \end{titlepage}}
    ```
    **大作业**： 根据西南大学学位论文规范，定制学位论文封面。参考[西南大学全日制本科学生毕业论文（设计）工作管理办法](http://ceie.swu.edu.cn/info/1047/2766.htm) 以及[西南大学学位论文封面](学位论文封面.pdf)， 一个示例可以参考：[SWU-Thesis-first-page.tex](SWU-Thesis-first-page.tex)

#### 交叉引用
交叉引用是 `LATEX` 强大的自动排版功能的体现之一。
* 在能够被交叉引用的地方，如章节、公式、图表、定理等位置使用 `\label` 命令: 
  ```latex
  \label{⟨label-name⟩}
  ```
  之后可以在别处使用 `\ref` 或 `\pageref` 命令，分别生成交叉引用的编号和页码: 
  ```latex
  \ref{⟨label-name⟩} \pageref{⟨label-name⟩}
  ```
* `\label` 命令可用于记录各种类型的交叉引用，使用位置分别为:
  * **章节标题**: 在章节标题命令 `\section` 等之后紧接着使用。
  * ** 行间公式**: 单行公式在公式内任意位置使用; 多行公式在每一行公式的任意位置使用。 
  * **有序列表**: 在 `enumerate` 环境的每个 `\item` 命令之后、下一个 `\item` 命令之前任意位置使用。 
  * ** 图表标题**: 在图表标题命令 `\caption` 之后紧接着使用。
  * **定理环境**: 在定理环境内部任意位置使用。
#### 脚注和边注
* 使用 `\footnote` 命令可以在页面底部生成一个脚注: `\footnote{⟨footnote⟩}`
* 有些情况下(比如在表格环境、各种盒子内)使用 `\footnote` 并不能正确生成脚注。我们可以分两步进行，先使用 `\footnotemark` 为脚注计数，再在合适的位置用 `\footnotetext` 生成脚注。比如:
  ```latex
  \begin{tabular}{l}
  \hline “天地玄黄，宇宙洪荒。日月盈昃，辰宿列张。”\footnotemark \\ \hline
  \end{tabular}
  \footnotetext{表格里的名句出自《千字文》。}
  ```
* 使用 `\marginpar` 命令可在边栏位置生成边注:
  ```latex
  \marginpar[⟨left-margin⟩]{⟨right-margin⟩}
  ```
  如果只给定了 `⟨right-margin⟩`，那么边注在奇偶数页文字相同; 如果同时给定了 `⟨left-margin⟩`，则 偶数页使用 `⟨left-margin⟩` 的文字。
#### 特殊环境
##### 列表
* LATEX提供了有序列表(`enumerate`)和无序列表(`itemize`)环境。两者用法类似。都是用 `\item` 标明每个列表项。`enumerate` 环境会自动对列表项编号。
* 其中 `\item` 可带一个可选参数，将有序列表的计数或者无序列表的符号替换成自定义的符号。
* 列表可以嵌套使用，最多嵌套四层。
  ```latex
  \begin{enumerate}
    \item An item.
    \begin{enumerate}
      \item A nested item.\label{itref}
      \item[*] A starred item.
    \end{enumerate}
    \item Reference(\ref{itref}).
  \end{enumerate}
  ```
* 关键字环境 `description` 的用法与以上两者类似，不同的是 `\item` 后的可选参数用来写关键字，以粗体显示，一般是必填的:
  ```latex
   \begin{description}
    \item[Enumerate] Numbered list.
    \item[Itemize] Non-numbered list.
  \end{description}
  ```
* 各级无序列表的符号由命令 `\labelitemi` 到 `\labelitemiv` 定义，可以简单地重新定义它们:
  ```latex
  \renewcommand{\labelitemi}{\ddag}
  \renewcommand{\labelitemii}{\dag}
  \begin{itemize}
    \item First item
    \begin{itemize}
      \item Subitem
      \item Subitem
    \end{itemize}
    \item Second item
  \end{itemize}
  ```
* 有序列表的符号由命令 `\labelenumi` 到 `\labelenumiv` 定义，重新定义这些命令需要用到计数器相关命令:
  ```latex
   \renewcommand{\labelenumi}%
    {\Alph{enumi}>}
  \begin{enumerate}
    \item First item
    \item Second item
  \end{enumerate}
  ```
##### 对齐环境
* `center`、`flushleft` 和 `flushright` 环境分别用于生成居中、左对齐和右对齐的文本环境。
* 除此之外，还可以用以下命令直接改变文字的对齐方式: `\centering`、`\raggedright`、`\raggedleft`
  ```latex
  \centering
  Centered text paragraph.
  \raggedright
  Left-aligned text paragraph.
  \raggedleft
  Right-aligned text paragraph.
  ```
##### 引用环境
* `LATEX` 提供了两种引用的环境:
  * `quote` 用于引用较短的文字，首行不缩进; 
  * `quotation` 用于引用若干段文字，首行缩进。引用环境较一般文字有额外的左右缩进。
* `verse` 用于排版诗歌，与 `quotation` 恰好相反，`verse` 是首行悬挂缩进的。
##### 摘要环境
摘要环境 `abstract` 默认只在标准文档类中的 `article` 和 `report` 文档类可用，一般用于紧跟 `\maketitle` 命令之后介绍文档的摘要。如果文档类指定了 `titlepage` 选项，则单独成页; 反之， 单栏排版时相当于一个居中的小标题加一个 `quotation` 环境，双栏排版时相当于 `\section*` 定义的一节。
##### 代码环境
有时我们需要将一段代码原样转义输出，这就要用到代码环境 `verbatim`，它以等宽字体排版代码，回车和空格也分别起到换行和空位的作用;带星号的版本更进一步将空格显示成“␣”。
```latex
\begin{verbatim}
#include <iostream>
int main()
{
  std::cout << "Hello, world!"
            << std::endl;
return 0; }
\end{verbatim}
```
要排版简短的代码或关键字，可使用 `\verb` 命令:
```latex
\verb|\LaTeX| \\
\verb+(a || b)+ \verb*+(a || b)+
```
#### 表格
排版表格最基本的 `tabular` 环境用法为:
```latex
\begin{tabular}[⟨align⟩]{⟨column-spec⟩} 
⟨item1⟩ & ⟨item2⟩ & ... \\
\hline
⟨item1⟩ & ⟨item2⟩ & ... \\
\end{tabular}
```
直接使用 `tabular` 环境的话，会和周围的文字混排。此时可用一个可选参数 `⟨align⟩` 控制垂 直对齐:`t` 和 `b` 分别表示按表格顶部、底部对齐，其他参数或省略不写(默认)表示居中对齐。
```latex
\begin{tabular}{|c|}
  center-\\ aligned \\
\end{tabular},
\begin{tabular}[t]{|c|}
  top-\\ aligned \\
\end{tabular},
\begin{tabular}[b]{|c|}
  bottom-\\ aligned\\
\end{tabular} tabulars.
```
但是通常情况下 `tabular` 环境很少与文字直接混排，而是会放在 `table` 浮动体环境中，并用 `\caption` 命令加标题。
##### 列格式
`tabular` 环境使用 `⟨column-spec⟩` 参数指定表格的列数以及每列的格式。基本的列格式见表

| 列格式| 说明|
|:---|:---|
| `l/c/r` | 单元格内容左对齐/居中/右对齐，不折行|
| `p{⟨width⟩}`| 单元格宽度固定为 `⟨width⟩`，可自动折行|
| `｜` | 绘制竖线|
| `@{⟨string⟩}`|自定义内容 `⟨string⟩`|
  > `@` 格式可在单元格前后插入任意的文本，但同时它也消除了单元格前后额外添加的间距。
* 另外 `LATEX` 还提供了简便的将格式参数重复的写法 `*{⟨n⟩}{⟨column-spec⟩}`，比如以下两种 写法是等效的
  ```latex
  \begin{tabular}{|c|c|c|c|c|p{4em}|p{4em}|}
  \begin{tabular}{|*{5}{c|}*{2}{p{4em}|}}
  ```
##### 列宽
`tabularx`引入了一个 `X` 列格式，类似 `p` 列格式，不过会根据表格宽度自动计算列宽，多个 `X` 列格式平均分配列宽。
  ```latex
  % \usepackage{array,tabularx}
  \begin{tabularx}{14em}%
  {|*{4}{>{\centering\arraybackslash}X|}}
    \hline
    A & B & C & D \\ \hline
    a & b & c & d \\ \hline
  \end{tabularx}
  ```
##### 横线
我们已经在之前的例子见过许多次绘制表格线的 `\hline` 命令。另外 `\cline{⟨i⟩-⟨j⟩}` 用来绘制跨越部分单元格的横线:
```latex
 \begin{tabular}{|c|c|c|}
  \hline
  4 & 9 & 2 \\ \cline{2-3}
  3 & 5 & 7 \\ \cline{1-1}
  8 & 1 & 6 \\ \hline
\end{tabular}
```
在科技论文排版中广泛应用的表格形式是**三线表**，形式干净简明。三线表由 `booktabs` 宏包支持，它提供了 `\toprule`、`\midrule` 和 `\bottomrule` 命令用以排版三线表的三条线，以及和 `\cline` 对应的 `\cmidrule`。除此之外，最好不要用其它横线以及竖线:
```latex
% \usepackage{booktabs}
\begin{tabular}{cccc}
  \toprule
   & \multicolumn{3}{c}{Numbers} \\
  \cmidrule{2-4}
           & 1 & 2 & 3 \\
  \midrule
  Alphabet & A & B & C \\
  Roman    & I & II& III \\
  \bottomrule
\end{tabular}
```
##### 合并单元格
* LATEX 是一行一行排版表格的，横向合并单元格较为容易，由 `\multicolumn` 命令实现:
  ```latex
  \multicolumn{⟨n⟩}{⟨column-spec⟩}{⟨item⟩}
  ```
* 纵向合并单元格需要用到 `multirow` 宏包提供的 `\multirow` 命令:
  ```latex
  \multirow{⟨n⟩}{⟨width⟩}{⟨item⟩}
  ```
* 一个结合 `\cline`、`\multicolumn` 和 `\multirow` 命令的例子:
  ```latex
  % \usepackage{multirow}
  \begin{tabular}{ccc}
    \hline
    \multirow{2}{*}{Item} &
      \multicolumn{2}{c}{Value} \\
    \cline{2-3}
      & First & Second \\ \hline
    A & 1     & 2 \\ \hline
  \end{tabular}
  ```
##### 行距控制
LATEX 生成的表格看起来通常比较紧凑。修改参数 `\arraystretch` 可以得到行距更加宽松的表格:
```latex
 \renewcommand\arraystretch{1.8}
\begin{tabular}{|c|}
  \hline
  Really loose \\ \hline
  tabular rows.\\ \hline
\end{tabular}
```
#### 图片
`LATEX` 本身不支持插图功能，需要由 `graphicx` 宏包辅助支持。
* 使用 `latex` + `dvipdfmx` 编译命令时，调用 `graphicx` 宏包时要指定 `dvipdfmx` 选项; 而使用 `pdflatex` 或 `xelatex` 命令编译时不需要。
* 使用 `xelatex` 命令是我们最推荐的方式, 因为它支持的图片格式最多。
* 插入图片命令`\includegraphics[⟨options⟩]{⟨filename⟩}`
* `\graphicspath` 命令用于设置图片文件路径，设置后可以使用相对路径。
  ```latex
  % 假设主要的图片放在 figures 子目录下，标志放在 logo 子目录下
  \graphicspath{{figures/}{logo/}}
  ```
* 在 `\includegraphics` 命令的可选参数 `⟨options⟩` 中可以使用 `⟨key⟩=⟨value⟩` 的形式，常用的参数如下:

  | 参数                | 含义                                       |
  |---------------------|--------------------------------------------|
  | width=⟨width⟩     | 将图片缩放到宽度为⟨width⟩                |
  | height=⟨height⟩   | 将图片缩放到高度为⟨height⟩                |
  | scale=⟨scale⟩     | 将图片相对于原尺寸缩放 ⟨scale⟩ 倍        |
  | angle=⟨angle⟩     | 将图片逆时针旋转 ⟨angle⟩ 度               |
  
  ```latex
  \begin{figure}
    \centering
    \includegraphics[scale=0.1, angle=90, origin=b]{example-image-a}
    \caption{Example Image A}
    \label{fig:example-A}
  \end{figure}
  ```
#### 盒子
  盒子是 `LATEX` 排版的基础单元，虽然解释略有抽象: 每一行是一个盒子，里面的文字从左到右依次排列; 每一页也是一个盒子，各行文字从上到下依次排布⋯⋯颇有一些活字印刷术的味道。
  LATEX 提供了一些命令让我们手动生成一些有特定用途的盒子。
##### 水平盒子
```latex
 \mbox{...} %生成一个基本的水平盒子，内容只有一行，不允许分段
 \makebox[⟨width⟩][⟨align⟩]{...} 
```
`\makebox` 更进一步，可以加上可选参数用于控制盒子的宽度 `⟨width⟩`，以及内容的对齐方式 `⟨align⟩`，可选居中 `c`(默认值)、左对齐 `l`、右对齐 `r` 和分散对齐 `s`。
```latex
|\mbox{Test some words.}|\\
|\makebox[10em]{Test some words.}|\\
|\makebox[10em][l]{Test some words.}|\\
|\makebox[10em][r]{Test some words.}|\\
|\makebox[10em][s]{Test some words.}|
```
一个实例是：
```latex
\makebox[12em][s]{本 科 毕 业 论 文 （ 设 计 ）}
```
##### 带框的水平盒子
`\fbox` 和 `\framebox` 让我们可以为水平盒子添加边框。使用的语法与 \mbox 和 \makebox
一模一样
```latex
\fbox{Test some words.}\\
\framebox[10em][r]{Test some words.}
```
可以通过 `\setlength` 命令调节边框的宽度 `\fboxrule` 和内边距 `\fboxsep`:
```latex
\framebox[10em][r]{Test box}\\[1ex]
\setlength{\fboxrule}{1.6pt}
\setlength{\fboxsep}{1em}
\framebox[10em][r]{Test box}
```
##### 垂直盒子
如果需要排版一个文字可以换行的盒子，`LATEX` 提供了两种方式:
```latex
\parbox[⟨align⟩][⟨height⟩][⟨inner-align⟩]{⟨width⟩}{...}
\begin{minipage}[⟨align⟩][⟨height⟩][⟨inner-align⟩]{⟨width⟩}
...
\end{minipage}
```
其中 `⟨align⟩` 为盒子和周围文字的对齐情况(类似 `tabular` 环境); `⟨height⟩` 和 `⟨inner-align⟩` 设置盒子的高度和内容的对齐方式，类似水平盒子 `\makebox` 的设置，不过 `⟨inner-align⟩` 接受的参数是顶部 `t`、底部 `b`、居中 `c` 和分散对齐 `s`。
##### 标尺盒子
`\rule` 命令用来画一个实心的矩形盒子，也可适当调整以用来画线(标尺):
```latex
\rule[⟨raise⟩]{⟨width⟩}{⟨height⟩}
```
例如：
```latex
Black \rule{12pt}{4pt} box.
Upper \rule[4pt]{6pt}{8pt} and
lower \rule[-4pt]{6pt}{8pt} box.
A \rule[-.4pt]{3em}{.4pt} line.
```
#### 浮动体
内容丰富的文章或者书籍往往包含许多图片和表格等内容。这些内容的尺寸往往太大，导致分页困难。`LATEX` 为此引入了浮动体的机制，令大块的内容可以脱离上下文，放置在合适的位置。
```latex
\begin{table}[⟨placement⟩] 
...
\end{table}
\begin{figure}[⟨placement⟩] 
...
\end{figure}
```
`⟨placement⟩` 参数提供了一些符号用来表示浮动体允许排版的位置，如 `hbp` 允许浮动体排版在**当前位置**、**底部**或者**单独成页**。`table` 和 `figure` 浮动体的默认设置为 `tbp`。

| 参数 | 含义                     |
|------|--------------------------|
| h    | 当前位置（代码所处的上下文） |
| t    | 顶部                     |
| b    | 底部                     |
| p    | 单独成页                 |
| !    | 在决定位置时忽视限制     |

> 排版位置的选取与参数里符号的顺序无关.

双栏排版环境下，`LATEX` 提供了 `table*` 和 `figure*` 环境用来排版跨栏的浮动体。它们的用法与 `table` 和 `figure` 一样，不同之处为双栏的 `⟨placement⟩` 参数只能用 `tp` 两个位置。
##### 浮动体的标题
图表等浮动体提供了 `\caption` 命令加标题，并且自动给浮动体编号。类似于 `\section` , 也有 `*` 版本, 以及可选参数设置短标题。

`\caption` 生成的标题, 可通过修改 `\figurename` 和 `\tablename` 的内容来修改标题的前缀。

`table` 和 `figure` 两种浮动体分别有各自的生成目录的命令:
```latex
\listoftables
\listoffigures
```
它们类似 `\tableofcontents` 生成单独的章节。
##### 并排和子图表
我们时常有在一个浮动体里面放置多张图的用法。最简单的用法就是直接并排放置，也可以通过分段或者换行命令 `\\` 排版多行多列的图片。以下为示意代码.
```latex
%\usepackage{mwe}
%\usepackage{graphicx}
\begin{figure}[htbp]
  \centering
  \includegraphics[width=0.45\textwidth]{example-image-a}
  \qquad
  \includegraphics[width=0.45\textwidth]{example-image-b}\\[2em]
  \includegraphics[width=0.9\textwidth]{example-image-duck}
  \caption{Side-by-side and full-width images}
\end{figure}
```
由于标题是横跨一行的，用 `\caption` 命令为每个图片单独生成标题就需要借助前文提到的 `\parbox` 或者 `minipage` 环境，将标题限制在盒子内。
```latex
\begin{figure}[htbp]
  \centering
  \parbox{0.45\textwidth}{
  \includegraphics[width=0.45\textwidth]{example-image-a}
  \caption{Image-A}}
  \qquad
  \parbox{0.45\textwidth}{
  \includegraphics[width=0.45\textwidth]{example-image-b}
  \caption{Image-B}}\\[2em]
  \includegraphics[width=0.9\textwidth]{example-image-duck}
  \caption{Side-by-side and full-width images}
\end{figure}
```
当我们需要更进一步，给每个图片定义小标题时，就要用到 `subcaption` 宏包的功能了。
```latex
%\usepackage{subcaption} % 子图支持
\begin{figure}[htbp]
  \centering % 子图 1
  \begin{subfigure}{0.45\textwidth}
    \centering
    \includegraphics[width=\textwidth]{example-image-a}
    \subcaption{Image-A}
  \end{subfigure}
  \qquad
  % 子图 2
  \begin{subfigure}{0.45\textwidth}
    \centering
    \includegraphics[width=\textwidth]{example-image-b}
    \subcaption{Image-B}
  \end{subfigure}\\[2em]
  \includegraphics[width=0.9\textwidth]{example-image-duck}
  \caption{Side-by-side and full-width images}
\end{figure}
```
### 排版数学公式
排版数学公式是`LATEX` 的强项。排版数学公式主要用到AMS 宏集:
* AMS 宏集由美国数学学会提供，核心是 `amsmath` 宏包，支持多行公式排版。
* 还包括 `amsfonts` 和 `amssymb` 宏包提供数学符号，`amsthm` 宏包扩展定理证明格式。
#### 公式排版基础
* 行内和行间公式
  * **行内公式**：与文字混排，用 `\(...\)` 包裹。
  * **行间公式**：单独成行，用 `\[...\]` 环境包裹。`\begin{equation}...\end{equation}`, 产生编号的公式。

> 进入数学模式后，空格被忽略，间距由符号性质决定。
> 不允许空行，无法用 `\\` 手动换行。
> 所有字母被视为数学变量。

##### 数学符号
* 一般符号
  * 希腊字母：如 `\alpha`、`\beta`、`\Gamma`、`\Delta`。
  * 无穷大符号：`\infty`。
  * 省略号：`\dots` 和 `\cdots`。
* 指数、上下标和导数
  * 用 `^` 和 `_` 标明上下标，子公式用花括号包裹。
* 分式和根式
  * 分式用 `\frac{分子}{分母}` 书写。
  * 根式用 `\sqrt{...}`；n次方根用 `\sqrt[n]{...}`。
* 关系符
  * 常用关系符号如 `=`、`>`、`<`、`\neq`、`\ge`、`\le`、`\approx`、`\equiv` 等。

* 算符
  * 二元算符如 `+`、`-`、`*`、`/`，其他用命令输入，如 `\times`、`\div`、`\pm`、`/mp`。

* 巨算符
  * 如积分号 `\int`、求和号 `\sum`、连乘号`\prod`，大小和形状在行内和行间公式中不同。
* 数学重音和上下括号
  * 加重音如 `\dot{r}`、`\ddot{r}`、`\vec{r}`、`\hat{\mathbf{e}}`、`\tilde{a}`。
  * 上/下括号用 `\overbrace` 和 `\underbrace` 生成。
* 箭头
  * 常用箭头如 `\rightarrow`、`\leftarrow`，`\xleftarrow` 和 `\xrightarrow` 可伸缩。
* 括号和定界符
  * 提供多种括号和定界符，如 `()`、`[]`、`{}`、`\langle \rangle`。
  * 使用 `\left` 和 `\right` 命令可令括号大小可变。

##### 多行公式
* 长公式折行
  * 优先在等号前折行，使用 `amsmath` 的 `multline` 环境。
* 多行公式对齐
  * 使用 `align` 环境对齐公式，`&` 分隔符通常放在等号左边。
* 公用编号的多行公式
  * 使用 `aligned`、`split`、`gathered` 等环境与 `equation` 环境套用。
##### 数组和矩阵
* 使用 `array` 环境排版二维数组，类似 `tabular` 环境。
* `amsmath` 提供多种矩阵环境，如 `matrix`、`pmatrix`、`bmatrix` 等。

##### 公式中的间距
* 使用 `\quad`、`\qquad`、`\,`、`\:`、`\;` 和 `\!` 调整间距。
#### 数学符号的字体控制
* 数学字母字体
  * 切换字体命令如 `\mathrm`、`\mathit`、`\mathbf`、`\mathcal`、`\mathfrak`、`\mathbb`。
* 加粗的数学符号
  * 使用 `\boldsymbol` 或 `\bm` 命令获得粗体或粗斜体。
* 数学符号的尺寸
  * 尺寸命令如 `\displaystyle`、`\textstyle`、`\scriptstyle`、`\scriptscriptstyle`。
#### 定理环境
`LATEX` 使用 `\newtheorem` 定义定理环境。
* `amsthm` 宏包
  * 提供定理格式切换，定义不带序号的定理环境。
    ```latex
    \theoremstyle{definition} \newtheorem{law}{Law}
    \theoremstyle{plain} \newtheorem{jury}[law]{Jury}
    \theoremstyle{remark} \newtheorem*{mar}{Margaret}
    ```
* 证明环境和证毕符号
  * 使用 `proof` 环境排版证明过程，自动加上证毕符号。使用 `\qedhere` 命令调整位置。
  * 如果行末是一个不带编号的公式，证毕符号会另起一行，可以使用 `\qedhere` 命令将证毕符号放在公式末尾。
  * 在 `align*` 等不带编号的环境中使用 `\qedhere` 也有效。

#### 附加信息
* **导言区命令**：在使用数学相关命令前，需要在导言区添加相应的宏包支持，例如 `\usepackage{amsmath}`。
* **交叉引用**：使用 `\label` 和 `\ref` 命令为公式生成交叉引用，`amsmath` 的 `\eqref` 命令为引用自动加上圆括号。
* **手动修改公式编号**：使用 `\tag` 命令手动修改公式的编号，或者用 `\notag` 命令取消为公式编号。
* **行间公式的对齐和编号位置**：由文档类选项控制，例如 `fleqn` 选项令行间公式左对齐；`leqno` 选项令编号放在公式左边。
* **数学模式的特点**：
  * 数学模式中输入的空格被忽略。
  * 不允许有空行（分段）。
  * 所有的字母被当作数学公式中的变量处理。
* **数学符号的尺寸**：数学符号按照符号排版的位置规定尺寸，包括行间公式尺寸、行内公式尺寸、上下标尺寸、次级上下标尺寸。
* **字体控制**：
  * 数学字母字体可以通过 `\mathrm`、`\mathit`、`\mathbf` 等命令切换。
  * 加粗的数学符号可以使用 `\boldsymbol` 或 `\bm` 命令获得。
  * 数学符号的尺寸可以通过 `\displaystyle`、`\textstyle` 等命令控制。
* **定理环境的自定义**：使用 `amsthm` 或 `ntheorem` 宏包自定义定理格式和环境。
### `LaTeX` 排版样式设定
#### 字体样式和字号
* `LATEX` 提供了两组修改字体的命令，全局影响和局部影响。
* 全局命令如 `\bfseries` 会影响之后所有的字符，局部命令如 `{\bfseries some text}` 只改变特定文本。
  
  | 命令          | 变体命令       | 效果       | 中文描述          |
  | ------------- | -------------- | ---------- | ----------------- |
  | \rmfamily     | \textrm{...}   | roman      | 衬线字体(罗马体) |
  | \sffamily     | \textsf{...}   | sans serif | 无衬线字体       |
  | \ttfamily     | \texttt{...}   | typewriter | 等宽字体         |
  | \mdseries     | \textmd{...}   | medium     | 正常粗细(中等)   |
  | \bfseries     | \textbf{...}   | bold face  | 粗体             |
  | \upshape      | \textup{...}   | upright    | 直立体           |
  | \itshape      | \textit{...}   | italic     | 意大利斜体       |
  | \slshape      | \textsl{...}   | slanted    | 倾斜体           |
  | \scshape      | \textsc{...}   | SMALL CAPS | 小型大写字母     |
  | \em           | \emph{...}     | emphasized | 强调，默认斜体   |
  | \normalfont   | \textnormal{...}| normal font| 默认字体         |

* 公式中的字体命令，如 `\mathbf`，用于修改数学字母样式。
* 字号命令的实际大小依赖于文档类及其选项。

  <div style="text-align:center">标准文档类中字体大小</div>

  | 字号          | 10pt选项(默认) | 11pt选项  | 12pt选项  |
  | ------------- | -------------- | --------- | --------- |
  | \tiny         | 5pt            | 6pt       | 6pt       |
  | \scriptsize   | 7pt            | 8pt       | 8pt       |
  | \footnotesize | 8pt            | 9pt       | 10pt      |
  | \small        | 9pt            | 10pt      | 10.95pt   |
  | \normalsize   | 10pt           | 10.95pt   | 12pt      |
  | \large        | 12pt           | 12pt      | 14.4pt    |
  | \Large        | 14.4pt         | 14.4pt    | 17.28pt   |
  | \LARGE        | 17.28pt        | 17.28pt   | 20.74pt   |
  | \huge         | 20.74pt        | 20.74pt   | 24.88pt   |
  | \Huge         | 24.88pt        | 24.88pt   | 24.88pt   |
* 使用字号命令时，通常需要用花括号进行分组。
  ```latex
  {\small The small and \textbf{bold} Romans ruled}
  {\Large all of great big {\itshape Italy}.}
  ```
* `\fontsize{⟨size⟩}{⟨base line-skip⟩}` 用到两个参数，`⟨size⟩` 为字号，`⟨base line-skip⟩` 为基础行距，一般设置为字号的 1.2 倍。如果不是在导言区，`\fontsize` 的 设定需要 `\selectfont` 命令才能立即生效。
* 选用字体宏包
  * 常用的字体宏包如 `lmodern`、`cmbright`、`euler` 等，提供了不同的字体风格。
    <div align="center"> 常见的LaTeX 字体宏包</div>

    | |文本/数学字体搭配的宏包  |
    | --- | --- |
    | Imodern | Latin Modern字体,对 Computer Modern字体的扩展 |
    | cmbright | 仿Computer Modern风格的无衬线字体 |
    | euler | Euler风格数学字体,也出自于高德纳之手 |
    | ccfonts | Concrete风格字体 |
    | txfonts | Times风格的字体宏包 |
    | pxfonts | Palatino风格的字体宏包 |
    | stix | Times风格的字体宏包 |
    | newtxtext,newtxmath | txfonts的改进版本,分别设置文本和数学字体 |
    | newpxtext,newpxmath | pxfonts的改进版本,分别设置文本和数学字体 |
    | mathptmx | psnfss字体宏集之一,Times风格,较为陈旧,不推荐使用 |
    | mathpazo | psnfss字体宏集之一,Palatino风格,较为陈旧,不推荐使用 |
    | fourier | Fourier风格数学字体,配合Utopia正文字体 |
    | fouriernc | Fourier风格数学字体,配合New Century Schoolbook正文字体 |
    | arev | Arev无衬线字体宏包,Vera Sans风格 |
    | mathdesign | 配合Charter/Garamond/Utopia正文字体的数学字体宏包 |
    | | **文本字体宏包** |
    | cm-unicode | Computer Modern风格的 Unicode字体,支持多种西方语言 |
    | dejavu | DejaVu开源字体 |
    | droid | Droid开源字体 |
    | inconsolata | Inconsolata开源等宽字体 |
    | libertine | Linux Libertine和 Linux Biolium开源字体 |
    | roboto | Roboto开源无衬线字体 |
    | sourcesanspro | Source Sans Pro开源无衬线字体 |
    | sourcecodepro | Source Code Pro开源等宽字体 |
    || **符号宏包**  |
    | mathabx | 数学符号宏包之一 |
    | MnSymbol | 数学符号宏包之一, 配合Minion Pro文本字体 |
    | fdsymbol | 数学符号宏包之一 |
    | pifont | Zapf Dingbats符号宏包 |
  * 字体编码如 OT1 和 T1，T1 字体编码更接近 ASCII 文本编码。
    ```latex
    \usepackage[T1]{fontenc}
    ```
* 使用 fontspec 宏包更改字体
  * `xelatex` 和 `lualatex` 编译命令支持直接调用系统中的 `.ttf` 或 `.otf` 格式字体。
  * `fontspec` 宏包提供了设置全局字体的命令。
    ```latex
	\setmainfont{⟨font name⟩}[⟨font features⟩]
	\setsansfont{⟨font name⟩}[⟨font features⟩]
	\setmonofont{⟨font name⟩}[⟨font features⟩]
    ```
	例如
    ```latex
    \setmainfont{Times New Roman}
    \setsansfont{Arial}[BoldFont={Arial Bold}, ItalicFont={Arial Italic}]
    ```
    > 需要注意的是，`fontspec` 宏包会覆盖数学字体设置。需要调用一些数学字体宏包时，应当在调用 `fontspec` 宏包时指定 `no-math` 选项。`fontspec` 宏包可能被其它宏包或文档类(如 `ctex` 文档类)自动调用时，则在文档开头的 `\documentclass` 命令里指定 `no-math` 选项。
* 更改中文字体
  * `ctex` 宏包或文档类提供了设置中文字体的命令。
    ```latex
    \setCJKmainfont{⟨font name⟩}[⟨font features⟩]
    \setCJKsansfont{⟨font name⟩}[⟨font features⟩]
    \setCJKmonofont{⟨font name⟩}[⟨font features⟩]
    %例如
    \setCJKmainfont{SimSun}[BoldFont=SimHei, ItalicFont=KaiTi]
    ```
* 使用 `unicode-math` 宏包配置 Unicode 数学字体
  * `unicode-math` 宏包允许调用 Unicode 数学字体配置数学公式的字体风格。
    ```latex
    %\usepackage{unicode-math}
    \setmathfont{⟨font name⟩}[⟨font features⟩]
    \setmathfont{Latin Modern Math}
    ```
    <div align="center">常用 Unicode 数学字体<div>
    
    | 数学字体名称         | 配套正文字体名称       | 备注                                       |
    | ------------------- | ---------------------- | ------------------------------------------ |
    |                    | 开源字体, 发布于CTAN    |                       |
    | Latin Modern Math   | Latin Modern           | 基于 Computer Modern 风格                  |
    | STIX Math           | STIX                   | Times 风格                                 |
    | XITS Math           | XITS                   | 基于 STIX, Times 风格, 有粗体 XITS Math Bold 可用 |
    | TeX Gyre Pagella Math | TeX Gyre Pagella     | Palatino 风格                              |
    | TeX Gyre Termes Math | TeX Gyre Termes       | Times 风格                                 |
    | TeX Gyre DejaVu Math | DejaVu Serif          | DejaVu 风格                                |
    | Libertinus Math     | Libertinus             | Linux Libertine 风格                       |
    | Garamond Math       | EB Garamond            | Garamond 风格                              |
    | Fira Math           | Fira Sans              | 无衬线数学字体                             |
    |                    | 商业字体                |                                        |
    | Cambria Math        | Cambria                | 微软 Office 预装的数学字体                 |
    | Lucida Bright Math OT | Lucida Bright OT      | 须购买商业授权                             |
    | Minion Math         | Minion Pro             | 须购买商业授权                             |
* 文字装饰和强调
  * 使用 `\underline` 命令为文字添加下划线(不自动换行)，`ulem` 宏包提供了更灵活的下划线解决方案。
  * `\emph` 命令将文字变为斜体以示强调。
  * 中文下划线: `\CJKunderline{text}`
  * 中文下波浪线: `\CJKunderwave{text}`

#### 段落格式和间距
* 长度和长度变量
  * 设置长度变量`\newlength{\⟨length command⟩}`
  * 长度的数值由数字和单位组成，如 `12pt`、`1.5cm`。
  <div align="centre">TEX/LATEX 中的长度单位</div>

  | 单位 | 描述 |
  | --- | --- |
  | pt  | 点 (point, 也译作“磅”), = 1/72.27 in |
  | bp  | 大点 (big point), = 1/72 in |
  | in  | 英寸, = 2.54 cm |
  | cm  | 厘米 |
  | mm  | 毫米 |
  | em  | 大致相当于当前字号下大写字母 M 的宽度, 常用于设定水平距离 |
  | ex  | 大致相当于当前字号下小写字母 x 的高度, 常用于设定垂直距离 |
  | mu  | 数学单位 (math unit), = 1/18 em |
  * 弹性长度如 `12pt plus 2pt minus 3pt` 表示基础长度为 12pt，可以伸展或收缩。
* 行距
  * `\linespread{factor}` 命令用于设置行距。
  > * 如果不是在导言区全局修改，而想要局部地改变某个段落的行距，需要用 `\selectfont` 命令使 `\linespread` 命令的改动立即生效
  > * 字号的改变是即时生效的，而行距的改变直到文字分段时才生效。
* 段落格式
  * `\setlength` 和 `\addtolength` 命令用于设置和增加段落缩进、间距等。
    ```latex
    %以下长度分别为段落的左缩进、右缩进和首行缩进:
    \setlength{\leftskip}{⟨length⟩}
    \setlength{\rightskip}{⟨length⟩}
    \setlength{\parindent}{⟨length⟩}
    %例如
    \setlength{\parindent}{20pt}
    ```
    段落间的垂直间距为 `\parskip`，如设置段落间距在 0.8ex 到 1.5ex 变动:
    ```latex
    \setlength{\parskip}{1ex plus 0.5ex minus 0.2ex}
    ```
* 水平间距
  * `\hspace` 命令用于插入额外的水平间距。
  > `\hspace` 命令生成的水平间距如果位于一行的开头或末尾，则有可能因为断行而被舍弃。可使用 `\hspace*` 命令代替 `\hspace` 命令得到不会因断行而消失的水平间距。
  * 命令 `\stretch{⟨n⟩}` 生成一个特殊弹性长度，参数 `⟨n⟩` 为权重。它的基础长度为 `0pt`，但可以无限延伸，直到占满可用的空间。如果同一行内出现多个 `\stretch{⟨n⟩}`，这一行的所有可用空间将按每个 `\stretch` 命令给定的权重 `⟨n⟩ `进行分配。
  * 命令 `\fill` 相当于 `\stretch{1}`
    ```latex 
    x\hspace{\stretch{1}}
    x\hspace{\stretch{3}}
    x\hspace{\fill}x
    ```
* 垂直间距
  * `\vspace` 命令用于增加段落之间的垂直间距。
  * `\vspace` 命令生成的垂直间距在一页的顶端或底端可能被“吞掉”，类似 `\hspace` 在一行的开头和末尾那样。对应地，`\vspace*` 命令产生不会因断页而消失的垂直间距。`\vspace` 也可用 `\stretch` 设置无限延伸的垂直长度。
  * 另外 LATEX 还提供了`\bigskip`, `\medskip`, `\smallskip` 来增加预定义长度的垂直间距。

#### 页面和分栏
* 页面参数
  * 使用 `\setlength` 命令可以修改页面尺寸和边距, ![页面边距图](页面边距图.png)
* 使用 `geometry` 宏包设置页面参数
  * `geometry` 宏包提供了简便的方法设置页面参数。
    ```latex
    \usepackage{geometry}
    \geometry{a4paper,left=1.25in,right=1.25in,top=1in,bottom=1in}
    ```
* 页面内容的垂直对齐
  * `\raggedbottom` 和 `\flushbottom` 命令分别用于设置页面内容的垂直方向向顶部对齐/分散对齐。
* 分栏
  * `multicol` 宏包提供了简单的多栏排版解决方案。
  > `multicol` 宏包能够在一页之中切换单栏/多栏，也能处理跨页的分栏，且各栏的高度分布平衡。但代价是在 `multicols` 环境中无法正常使用 `table` 和 `figure` 等浮动体环境，它会直接让浮动体丢失。`multicols` 环境中只能用跨栏的 `table*` 和 `figure*` 环境，或者用 `float` 宏包提供的 `H` 参数固定浮动体的位置。
#### 页眉页脚
* 基本的页眉页脚样式
  * `\pagestyle` 和 `\thispagestyle` 命令用于修改页眉页脚的样式。
    ```latex
    \pagestyle{headings}
    ```
* 手动更改页眉页脚的内容
  * `\markright` 和 `\markboth` 命令用于手动修改页眉的内容。
  * `fancyhdr` 宏包
    * `fancyhdr` 宏包改善了页眉页脚样式的定义方式。
      ```latex
      \usepackage{fancyhdr}
      \pagestyle{fancy}
      \fancyhf{}
      \fancyfoot[C]{\bfseries\thepage}
      ```
### 特色工具和功能
#### 参考文献和 `BIBTEX` 工具
* `LaTeX` 提供 `\cite` 命令用于正文中引用参考文献。
  ```latex
  \documentclass{article}
  \begin{document}
  \section{Introduction}
  Partl~\cite{germenTeX} has proposed that \ldots
  \begin{thebibliography}{99}
  \bibitem{germenTeX} H.~Partl: \emph{German \TeX},
  TUGboat Volume~9, Issue~1 (1988)
  \end{thebibliography}
  \end{document}
  ```
* `BIBTEX` 数据库
  * `BIBTEX` 允许自动生成不同样式的参考文献列表。
    ```bibtex
    @article{Alice13,
    title = {Demostration of bibliography items},
    author = {Alice Axford and Bob Birkin and Charlie Copper and Danny Dannford},
    year = {2013},
    month = {Mar},
    journal = {Journal of \TeX perts},
    volume = {36},
    number = {7},
    pages = {114-120}
    }
    ```
* `BIBTEX` 样式
  * `BIBTEX` 用样式（style）管理参考文献的写法，如 `plain`, `unsrt`, `alpha` 等。
    ```latex
    \bibliographystyle{plain}
    ```
* 使用 `BIBTEX` 排版参考文献
  * 利用 `BIBTEX` 数据库生成参考文献和引用，需要指定参考文献格式，引用参考文献，并使用 `\bibliography` 命令。
    ```latex
    \documentclass{article}
    \bibliographystyle{plain}
    \begin{document}
    \section{Some words}
    Some excellent books, for example, \cite{citation1}
    and \cite{citation2} \ldots
    \bibliography{books}
    \end{document}
    ```

* natbib 宏包
  * `natbib` 宏包提供人名——年份的引用方式，如 `(Axford et al., 2013)`。
    ```latex
    \usepackage{natbib}
    \citep{Alice13}
    ```
* biblatex 宏包
  * `biblatex` 宏包是基于 LaTeX 宏命令的参考文献解决方案。
    ```latex
    \usepackage[style=gb7714-2015]{biblatex}
    \addbibresource{egbibdata.bib}
    \begin{document}
    见文献\cite{caimin2006}。
    \printbibliography
    \end{document}
    ```
#### 索引和 `makeindex` 工具
* 使用 `makeindex` 工具的方法
  * `LaTeX` 借助 `makeindex` 程序完成对索引的排版。
    ```latex
    \usepackage{makeidx}
    \makeindex
    \index{hello}
    ```
* 索引项的写法
  * 索引项的添加使用 `\index` 命令，支持普通索引、分级索引、格式化索引等多种写法。
    ```latex
    \index{hello!Peter}
    ```
#### 使用颜色
* 颜色的表达方式
  - `color` 或 `xcolor` 宏包提供了对颜色的支持。
    ```latex
    \usepackage{xcolor}
    \color{red} This is red text.
    ```
* 带颜色的文本和盒子
  * 可以使用 `\textcolor`、`\colorbox` 和 `\fcolorbox` 命令为文本和盒子添加颜色。
    ```latex
    \textcolor{blue}{Blue text}
    \colorbox{yellow}{Yellow background}
    ```
#### 使用超链接
* `hyperref` 宏包
  * `hyperref` 宏包为 PDF 生成超链接功能。
    ```latex
    \usepackage{hyperref}
    \hypersetup{colorlinks=true}
    ```
* 超链接
  * `hyperref` 宏包提供了直接书写超链接的命令。
    ```latex
    \href{https://wikipedia.org}{Wiki}
    ```
* `PDF` 书签
  * `hyperref` 宏包为 PDF 生成书签。
    ```latex
    \pdfbookmark[1]{Introduction}{intro}
    ```
* `PDF` 文档属性
  * `hyperref` 宏包提供了参数用于改变 PDF 文档的属性。
    ```latex
    \hypersetup{pdftitle={My Document}, pdfauthor={Author Name}}
    ```

### LaTeX 高级排版

#### 多文档管理与引用

##### 使用subfile管理多文档
当涉及到 LaTeX 中的多文档管理与引用时，通常可以使用 subfiles 包来帮助组织和管理不同部分的文档。以下是一个简单的示例框架，展示了如何使用 subfiles 包在主文件和子文件之间进行协作。

我们用到的目录结构如下：

```bash
project/
├── main.tex
├── secs/section1.tex
└── secs/section2.tex
```

首先，确保你的主文件和子文件都在同一目录下，并安装了 subfiles 包（如果未安装，可以通过 LaTeX 发行版的包管理器进行安装）。

###### 主文件代码示例
```tex
\documentclass{ctexart}
\usepackage{subfiles}
\newcommand{\autoref}[1]{第\ref{#1}节}

\title{多文档管理与引用示例}
\author{你的名字}

\begin{document}
\maketitle
\section{引言}
这是主文件的引言部分。

\subfile{secs/section1.tex} % 导入子文件section1.tex
\subfile{secs/section2.tex} % 导入子文件section2.tex
\end{document}
```

###### 子文件（section1.tex）代码示例
```tex
% secs/section1.tex
\documentclass[../main.tex]{subfiles}
\begin{document}
\section{第一节标题}
\label{sec:section1}
这是第一节的内容。可以在这里引用其他部分的内容， 如第二节的内容可以用\autoref{sec:section2} 来引用。
\end{document}
```

###### 子文件（section2.tex）代码示例
```tex
% secs/section2.tex
\documentclass[../main.tex]{subfiles}
\begin{document}
\section{第二节标题}
\label{sec:section2}
这是第二节的内容。可以在这里引用第一节的内容， 如第一节的内容可以用\autoref{sec:section1} 来引用。
\end{document}
```

编译命令如下：
```bash
/* 编译主文件 */
pdflatex main.tex
/* 单独编译section1.tex */
cd secs
pdflatex section1.tex
/* 单独编译section2.tex */
pdflatex section2.tex
```
注意：单独编译时会导致交叉引用不能正确显示。

#### 算法与源代码排版

##### 算法排版

```tex
\documentclass{article}
\usepackage{algorithm}
\usepackage{algpseudocode}

\begin{document}

\begin{algorithm}
\caption{Euclidean Algorithm}\label{euclid}
\begin{algorithmic}[1]
\Procedure{Euclid}{$a,b$}\Comment{The g.c.d. of a and b}
\State $r \gets a \bmod b$
\While{$r \neq 0$}
\State $a \gets b$
\State $b \gets r$
\State $r \gets a \bmod b$
\EndWhile
\State \textbf{return} $b$
\EndProcedure
\end{algorithmic}
\end{algorithm}

As shown in Algorithm~\ref{euclid}, this is the Euclidean algorithm for finding the greatest common divisor.

\end{document}
```

在这个示例中，我们定义了一个名为“Euclidean Algorithm”的算法，并使用了 `\Procedure` 和 `\EndProcedure` 来定义算法的开始和结束。`\Comment` 用于添加注释，`\State` 表示算法的每一步操作，`\While` 和 `\EndWhile` 用于循环结构。

#### 源代码排版

首先，我们需要利用 `pip` 来安装代码高亮的编译器和样式表：

```bash
pip install pygments pygments-mathematica
```

然后可以在导言区引入 `minted` 宏包：

```tex
\usepackage{minted}
\usemintedstyle{mathematica} % 选择代码高亮风格
```

在正文中就可以排版代码，注意在编译的时候需要添加 `-shell-escape` 选项来允许 `minted` 执行外部命令：

```bash
\begin{minted}{wolfram}
  (* Mathematica code *)
  N[Pi, 50];
  Table[i^2, {i, 1, 5}]
\end{minted}
```

### 论文模板制作

#### 将常用命令打包成一个package

```tex
% mytemplate.sty
\NeedsTeXFormat{LaTeX2e}
\ProvidesPackage{mytemplate}[2024/06/19 My LaTeX Template]

% Load packages with options
\usepackage[scheme=chinese, zihao=-4, heading=true]{ctex}

% Define environment
\newenvironment{enabstract}
{\renewcommand{\abstractname}{Abstract}%
\begin{abstract}}%
{\end{abstract}}

\endinput
```

将其保存为 `mytemplate.sty`, 然后可以像一个宏包一样正常使用。

```tex
\documentclass{book}
\usepackage{mytemplate}

\begin{document}
测试包文件
\end{document}
```

#### 创建一个类文件

```tex
% myclass.cls
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{myclass}[2024/06/19 v1.0 My custom LaTeX document class]

\LoadClass[12pt]{ctexart}

\DeclareOption{a4paper}{
  \PassOptionsToClass{a4paper}{ctexart}
}

\ProcessOptions

\ifx\pdfpagewidth\undefined
  \paperwidth=210mm
  \paperheight=297mm
\else
  \paperwidth=\pdfpagewidth
  \paperheight=\pdfpageheight
\fi

\endinput
```

将其保存为 `myclass.cls`，我们可以这样使用：

```tex
\documentclass[a4paper]{myclass}
\usepackage{geometry}
\begin{document}
纸张宽度为\the\paperwidth, 我定义的长度为\the\mylength.
\end{document}
```

### 实践作业

- 使用在线表格生成器，帮助生成 LaTeX 表格：[Tables Generator](https://www.tablesgenerator.com)
- 自学代码作图Tikz/Metapost. 例如，使用在线MetaPost预览，画一个半径为2cm的圆，并标注圆心 $O$. [MetaPost Preview](http://www.tlhiv.org/mppreview/)
  ```metapost
  draw fullcircle scaled 2cm;
  dotlabel.lrt(btex $O$ etex, origin);
  ```
- 下载并编译中国科学技术大学的毕业论文模板：[USTC Thesis](https://github.com/ustctug/ustcthesis)
- 下载并编译全国大学生数学建模竞赛模板：[CUMCM Thesis](https://github.com/latexstudio/CUMCMThesis)
- 下载并编译美国大学生数学建模竞赛模板：[MCM Thesis](https://github.com/latexstudio-org/mcmthesis)

### LaTeX 在学术写作中的应用

#### 学术写作规范

##### 基本原则

- 不要抄袭任何已经发表的、未发表但不是你创作的、或者网络上搜索到的文字
- 不要“复制粘贴”网络上的或者论文中的图片

上述两条非常容易导致查重率偏高。
> 查重率和分数直接相关。
  * 毕业论文最终成绩一律按优秀（90及以上）、良好（80-89）、中等（70-79）、及格（60-69）、不及格（60以下）五级评定。
  * 评定``优秀''成绩的学生论文的查重率不超过20\%，且学生人数原则上不超过本专业毕业学生总数的30\%；
  * 评定``良好''成绩的学生论文的查重率不超过25\%，且学生人数一般不超过本专业学生总数的50\%。

##### 主要结构以及要点

###### 题目
- 简洁、副标题慎重选择
- 如果最终题目和开题提交的题目不吻合，切记在终稿查重之前提交题目变更申请, 否则需要自费查重。
- 作者、单位写法要规范；
- 检查指导教师姓名是否正确。


###### 摘要
* 摘要必须简洁，一般写一段话即可
* 按照研究背景、研究意义价值、研究难点、研究内容（模型）、研究结果与反思的顺序，每点写1-2句话。
* 英文摘要一般是中文摘要的翻译，当慎用百度翻译，必须自己检查一遍。
* 关键词一般3-5个，中英文对照。一般用分号隔开，英文首字母大写。

###### 论文结构与目录

1. 绪论（Introduction）
   - 研究背景
   - 研究目标
   - 研究方法、路径
2. 文献综述（Literature Survey）
3. 研究内容（Research Contents）可以分多个章节
4. 总结与展望（Conclusions and Further Development）
5. 参考文献（Bibliography）
6. 致谢（Acknowledgments）
7. 附录（Appendices）

###### 段落写作要点
各个章节都按照这样的段落来写：
  - 每段只写一个主要意思
  - 每段按照总-分、总-分-总展开。 前面1-2句是主题句、后面3-4句是展开。
  - 调整语序、注意段落衔接、长短句结合。
  - 一个段落差不多$1/3$页面长度，调整文字长度、图表大小、不要大片空白。
  - 使用书面用语、语法正确、用词简洁。

###### 研究背景
- 已有文献综述（历史文献中一般有背景）；
- 提出自己的问题（研究动机）；
- 目前根自己问题相关的研究（研究现状）；
- 现有研究方法的不足、你的创新（研究意义）。

###### 研究目标
根据你提的问题，提出研究目标。

* 简介研究目标。（介绍问题的定义和研究目标）
* 简介研究内容。（介绍你研究哪些具体问题）
* 研究意义总结。（介绍研究意义）
* 本文组织架构。（介绍每章节内容）


###### 文献综述
相关工作这一章应该包含12-20篇不同的引用文献，大部分的文献应该是发表于正式的刊物上，至少包含5篇近3年发表在核心期刊和会议的论文。至少包括两篇英文文献。
- 介绍和本论文相关的至少两个类别的研究领域。
- 每个类别按照如下结构，按照时间先后顺序进行梳理。
  - 早期工作
  - 近期工作
  - 相关工作总结与不足


###### 文献引用
凡是用到了别人的观点、提到了别人的名字、参考了别人的图、引用了别人的数据，或者是希望读者去看别人已发表的论文，都需要引用。

下面的引用举例：
- CNN模型近年来成功应用在图像识别中[2,3,4,5]。
- 放到句末：近年来,已有一些研究人员尝试使用了矩阵分解框架[1-3]。
- 用作者名字：Li 等人[7]提出使用矩阵分解算法。
- 用文献：在文献[10]中使用了矩阵分解算法。
- 直接使用模型名字：MF[9]分解用户评分矩阵。
- 直接引述观点：使用社交网络关系被证明能提高推荐的准确度[5]。

凡是图片参考了别人的论文重新绘制，或者直接使用了来自别人论文的论文，必须在图表标题上写明：
- 图1. xxx, 参考[1]绘制；
- 图2. xxx, 图片来自[2].

此外，
- 正文中提到的文献都需要用上标或者方框进行标注。采用人名或者参考文献出现的顺序排序。
- 如果引用的是网址，一般用脚注。
- 外国人名、模型方法名、一般不翻译成中文。
###### 参考文献
* 参考文献严格按照`GB/T 7714－2005`规则，使用`CNKI`等专业数据库导出参考文献（`bibtex`数据）。
* 在`LaTeX` 中使用`bibtex`等参考文献排版工具。

##### 数学符号的书写
- 数学比较贵，需要用美元符号包起来：a与$a$与$\alpha$, $log$与$\log,\ln$, $sin^2$与$\sin^2$;
- 数学公式后面（包括独立成行的公式）需要根据行文确定标点符号，一律用英文。
- 阿拉伯数字和字母一般用半角，占半个汉字位置。
  十以内的数字用汉字，如五；十以上的数字用阿拉伯数字，如15；
  后面带单位、符号的用阿拉伯数字，如4.1\%；
  表示序号的用阿拉伯数字，如图1;
  一句话不以阿拉伯数字开头，如果开头要用汉字。
#### 调查问卷表
##### 问卷设计
问卷目的: 明确问卷的目标，例如：
- 了解学生对数学课程的满意度。
- 探讨学生在数学学习中的困难。
- 收集学生对数学教学方法的反馈。
- 研究学生在数学学习中的时间投入和成绩之间的关系。
##### 问题类型
- **背景信息**（如性别、年龄、年级等）：
  ```txt
  1. 您的性别是？
	 a. 男
	 b. 女
  ```
- **选择题**（单选、多选）：
  ```txt
  2. 您对数学课程的总体满意度如何？
	 A. 非常满意
	 B. 满意
	 C. 一般
	 D. 不满意
  ```
- **量表题**（李克特量表，如1-5分）：
  ```txt
	3. 您认为数学课的教学内容是否适中？
	   1 - 非常不适中
	   2 - 不适中
	   3 - 一般
	   4 - 适中
	   5 - 非常适中
  ```
- 开放式问题
  ```txt
  4. 您认为数学课程中最困难的部分是什么？请具体说明。
  ```
##### 问卷结构
- **介绍**：简要说明问卷的目的和重要性，告知问卷保密性。
- **背景信息**：收集基本人口统计信息。
- **主体部分**：围绕研究目标设计的问题。
- **感谢语**：感谢参与者的时间和配合。
##### 计算方法

数据整理：
* ** 数据输入**：将问卷数据输入到电子表格或统计软件中，如Excel、SPSS、R等。
* **编码**：对定性数据进行编码，例如将“男”编码为1，“女”编码为2。

描述性统计:
- **频数分布**：计算每个选项的频数和百分比。
- **集中趋势**：计算均值、中位数、众数。
- **离散趋势**：计算标准差、方差、范围。

推断性统计：
- **假设检验**：如t检验、卡方检验，检验不同组别间的差异。
- **相关分析**：如皮尔逊相关系数，分析变量间的相关性。
##### 结果分析（统计公式）
* 描述性统计公式:
  - **均值（Mean）**：
	$$
	  \bar{X} = \frac{\sum_{i=1}^n X_i}{n}
	$$
  - **标准差（Standard Deviation）**：
	$$
		s = \sqrt{\frac{\sum_{i=1}^n (X_i - \bar{X})^2}{n-1}}
	$$
* 推断性统计公式:
  * **t检验**
  适用于比较两组样本的均值是否存在显著差异。例如，可以用于比较男生和女生对数学课程满意度的平均值。
  $$
  t = \frac{\bar{X}_1 - \bar{X}_2}{\sqrt{\frac{s_1^2}{n_1} + \frac{s_2^2}{n_2}}}
  $$
  其中，$\bar{X}_1$ 和 $\bar{X}_2$ 是两组样本的均值，$s_1$ 和 $s_2$ 是样本的标准差，$n_1$ 和 $n_2$ 是样本大小。


  * **卡方检验 (Chi-Square Test)**
  用于检验实际观测值与理论预期值之间是否存在显著差异。
  $$
  \chi^2 = \sum \frac{(O_i - E_i)^2}{E_i}
  $$
  其中，$O_i$ 是观察频数，$E_i$ 是期望频数。自由度 $df = \text{分类总数} - 1$，即分类总数减一。

  * **相关系数 (Correlation Coefficient)**
	用于测量两个变量之间的线性关系强度。例如，可以分析学习时间与数学成绩之间的相关性。
	$$
	r = \frac{\sum (X_i - \overline{X})(Y_i - \overline{Y})}{\sqrt{\sum (X_i - \overline{X})^2 \sum (Y_i - \overline{Y})^2}}
	$$
	其中：
	  - $X_i$ 和 $Y_i$ 是两个变量的观测值。
	  - $\overline{X}$ 和 $\overline{Y}$ 是两个变量的平均值。

##### 图表分析

利用图表展示数据，并对结果进行说明与分析，以下是步骤与注意事项：

1. **图表说明**  
   - 表 X 展示了 xxx 的结果。
   - 对比分析，提供具体数值或比例。

2. **分析原因**  
   - 解释结果的优劣。例如：说明为何某方法效果更好或更差。

###### 图表注意事项

- **高清图片**：请使用无水印的高清图片，避免网络截图。  
- **大小合适**：图表在打印后文字和线条应保持清晰。  
- **避免空白**：图片内不要留过多空白区域。  
- **表格格式**：
  - 使用三线表格式（无竖线）。
  - 保持单元格对齐方式统一。
#### 检查清单
* 页码是否正常显示？论文最后是否有不想关的表格？
* 是否有错别字、句子是否通顺、语法是否正确？
* 标点符号:
  * 编号文本后面是否有句号或分号？
  * 长图表标题需要有句号，短的不需要。
  * 公式标点符号: 公式后面有解释用逗号，否则用句号。多行公式，各个公式之间用逗号。都用英文标点。
  * 数学名词缩写在第一次出现时应该写出全称。
  * 重要公式独立编号，多行公式共享一个编号。

#### 毕业论文撰写指导
##### 毕业论文撰写的一些建议
###### 如何选题
- **构思主题**：从自己最感兴趣的一门学科入手，尝试构思研究方向。
- **查找文献**：利用 CNKI、万方等专业数据库进行检索，寻找相关领域的研究成果。
- **确定主题**：根据阅读的文献，逐步聚焦具体研究问题。
- **与导师沟通**：在初步选定主题和研究思路后，与指导老师讨论并确定最终方向。
- **撰写初稿**：完成论文初稿后，再次与导师沟通，持续优化内容和结构。
###### 如何阅读文献
- **快速浏览**：
  1. 首先阅读摘要，了解文章核心内容。
  2. 然后查看主要结论，明确研究成果和创新点。
  3. 最后关注细节和背景部分，深入理解相关理论与方法。

- **有效标注**：总结文献的主要结论，标记重要内容与关键思路。

- **重点理解**：聚焦文献中关键部分，确保对核心理论与方法的深入理解。
