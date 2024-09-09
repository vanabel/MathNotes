# 数学教学笔记仓库

欢迎来到数学教学笔记仓库！该仓库包含了与 Obsidian 教学笔记和 Python 开发相关的各种资源。以下是目录结构的概述及各目录的内容介绍。

## 目录结构

### AnalyticGeometry
- **欢迎.md**: 关于解析几何的欢迎笔记。

### copilot-conversations
- **为什么天空是蓝色的，夕阳的时候又是红色的？@2024_09_08_14_39_21.md**: 关于天空为何是蓝色，夕阳为何是红色的对话记录。
- **帮助我学习微分中值定理。@2024_09_08_15_05_03.md**: 帮助学习微分中值定理的对话记录。
- **帮助我学习微分中值定理。@2024_09_08_15_11_55.md**: 另一份关于微分中值定理的对话记录。

### MathSoftwear
- **attachments**: 数学软件相关的附件文件。
  - **bibdata**: 参考文献数据目录。
  - **figures**: 图形文件目录。
  - **images**: 图片文件目录。
  - **Pdffiles**: PDF 文件目录。
  - **_vimrc**: Vim 配置文件。
- **creation_times.txt**: 记录文件创建时间的文本文件。
- **out**: LaTeX 生成的输出文件。
  - **test.aux**, **test.fdb_latexmk**, **test.fls**, **test.log**, **test.synctex(busy)**, **test.synctex.gz**, **test.synctex.gz.sum.synctex**: 各种 LaTeX 临时文件。
  - **test.tex**, **test.pdf**: 主 LaTeX 文件及其生成的 PDF 文件。
- **python-dev**: Python 开发目录。
  - **venv**: Python 虚拟环境目录。
- **作业一、Vim常见操作.md**: 关于 Vim 常见操作的 Markdown 文件。
- **前言.md**: 文档的前言部分。
- **数学软件课程讲义.md**: 数学软件课程的讲义。
- **第一章、数学软件介绍.md**: 介绍数学软件的第一章。
- **第二章、Geogebra几何画板.md**: 关于 Geogebra 的第二章。
- **第三章、Mathematica 数学符号计算软件.md**: 关于 Mathematica 的第三章。
- **第四章、LaTeX科学排版软件.md**: 关于 LaTeX 的第四章。
- **课程大纲.md**: 课程大纲。
- **附录一、Obsidian笔记系统与文本编辑器Vim.md**: 关于 Obsidian 和 Vim 的附录一。
- **附录二、Vim的配置.md**: 关于 Vim 配置的附录二。
- **附录三、Git以及LLM.md**: 关于 Git 和 LLM 的附录三。
- **附录四、常见问题解答.md**: 常见问题解答的附录四。

### scripts
- **ManageMarkdownCreationTimes.bat**: 用于管理 Markdown 创建时间的批处理脚本。

### templates
- **参考文献模版.md**: 参考文献的模板。
- **插入问题.md**: 插入问题的模板。
- **课程备课模版.md**: 课程备课的模板。
- **课程笔记模版.md**: 课程笔记的模板。

## 开始使用

要开始使用本仓库，请按以下步骤操作：

1. **克隆仓库**:
   ```sh
   git clone https://github.com/vanabel/MathNotes.git
   ```

2. **进入目录**:
   ```sh
   cd MathNotes
   ```

3. **设置 Python 环境**:
   - 确保你已安装 Python。
   - 创建并激活虚拟环境：
     ```sh
     python -m venv python-dev/venv
     source python-dev/venv/bin/activate  # Windows 用户使用 `python-dev\venv\Scripts\activate`
     ```

4. **安装依赖**（如果有的话）:
   ```sh
   pip install -r requirements.txt
   ```

5. **浏览文件**: 根据需要使用 Markdown 文件和模板。

## 贡献

欢迎对本项目进行贡献，请提交拉取请求或打开问题。请确保你的贡献符合项目的目标，并遵守编码标准。

## 许可证

本项目采用 MIT 许可证 - 详情见 [LICENSE](LICENSE) 文件。

## 联系

如有任何问题或建议，请联系 [Van Abel](mailto:van141.abel@gmail.com)。

