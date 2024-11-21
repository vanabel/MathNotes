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

