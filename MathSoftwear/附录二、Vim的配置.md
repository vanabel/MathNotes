## Vim的基本配置
1. 查看vim配置文件: 在`vim`中执行 `:version`，查看配置文件所在位置
2. 编辑配置文件，例如我使用`:e $VIM\gvimrc`
3. 添加常见配置
   ```vim
   set nocp
   set nu
   set hls is
   syntax on
   filetype indent on
   filetype plugin on
   set guioptions-=mrLtT
   set lines=15 columns=9999
   :winp 0 0
   set bg=light
   set enc=utf-8
   set fencs=utf-8,cp936,big5,iso-8859-1
   autocmd FileType markdown setlocal spell
   autocmd FileType markdown setlocal wrap
   autocmd FileType markdown setlocal shiftwidth=2
   autocmd FileType markdown setlocal expandtab
   autocmd FileType markdown setlocal tabstop=2
   autocmd FileType markdown setlocal softtabstop=2
   ```

## Vim高级配置
1. 安装插件管理[`vim-plug`](https://github.com/junegunn/vim-plug)以及`Git`（可能需要添加`git`到系统目录）: 
   ```bash
    iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim |`                   >>     ni $HOME/vimfiles/autoload/plug.vim -Force
   ```

2. 安装插件，并更新配置
   ```vim
   call plug#begin('~/.vim/plugged')
   Plug 'junegunn/seoul256.vim'
   Plug 'neoclide/coc.nvim'
   Plug 'preservim/nerdtree'
   " Start NERDTree and put the cursor back in the other window.
   nnoremap <F3> :NERDTreeToggle<CR>
   Plug 'xuyuanp/nerdtree-git-plugin'
   Plug 'altercation/vim-colors-solarized'
   Plug 'vim-airline/vim-airline'
   Plug 'vim-airline/vim-airline-themes'
   Plug 'farmergreg/vim-lastplace'
   
   let g:airline_theme='solarized'
   let g:airline_solarized_bg='light'
   " please install https://github.com/powerline/fonts/blob/master/DejaVuSansMono/DejaVu%20Sans%20Mono%20for%20Powerline.ttf
   set guifont=DejaVu_Sans_Mono_for_Powerline:h16:cANSI:qDRAFT
   
   let g:airline_powerline_fonts = 1
   let g:airline#extensions#tabline#enabled = 1
   call plug#end()
   
   silent! colorscheme solarized
   
   nnoremap nw <c-w><c-w>
   noremap ;p "*p
   noremap ;x "*y
   
   autocmd VimEnter *.md NERDTree | wincmd p
   
   
   if !exists('g:airline_symbols')
   	let g:airline_symbols = {}
   endif
   
   " unicode symbols
   let g:airline_left_sep = '»'
   let g:airline_left_sep = '▶'
   let g:airline_right_sep = '«'
   let g:airline_right_sep = '◀'
   let g:airline_symbols.colnr = ' ㏇:'
   let g:airline_symbols.colnr = ' ℅:'
   let g:airline_symbols.crypt = '🔒'
   let g:airline_symbols.linenr = '☰'
   let g:airline_symbols.linenr = ' ␊:'
   let g:airline_symbols.linenr = ' ␤:'
   let g:airline_symbols.linenr = '¶'
   let g:airline_symbols.maxlinenr = ''
   let g:airline_symbols.maxlinenr = '㏑'
   let g:airline_symbols.branch = '⎇'
   let g:airline_symbols.paste = 'ρ'
   let g:airline_symbols.paste = 'Þ'
   let g:airline_symbols.paste = '∥'
   let g:airline_symbols.spell = 'Ꞩ'
   let g:airline_symbols.notexists = 'Ɇ'
   let g:airline_symbols.notexists = '∄'
   let g:airline_symbols.whitespace = 'Ξ'
   
   " powerline symbols
   let g:airline_left_sep = ''
   let g:airline_left_alt_sep = ''
   let g:airline_right_sep = ''
   let g:airline_right_alt_sep = ''
   let g:airline_symbols.branch = ''
   let g:airline_symbols.colnr = ' ℅:'
   let g:airline_symbols.readonly = ''
   let g:airline_symbols.linenr = ' :'
   let g:airline_symbols.maxlinenr = '☰ '
   let g:airline_symbols.dirty='⚡'
   ```
3. 安装字体[DejaVu Sans Mono for Powerline.ttf](https://github.com/powerline/fonts/blob/master/DejaVuSansMono/DejaVu%20Sans%20Mono%20for%20Powerline.ttf)
4. 安装`nvm-windows`， 修改为国内淘宝源
   ```bash
   nvm npm_mirror https://npmmirror.com/mirrors/npm/
   nvm node_mirror https://npmmirror.com/mirrors/node/
   ```
   然后执行`nvm use 20.16.0`以及`nvm install 20`以安装`npm`和`node.js`
5. 执行`:PlugInstall` 如果一次不成功，可以多试几次。

## Vim使用Python
- 安装python 虚拟环境管理软件并用它来安装python
	- [官方文档](https://github.com/pyenv-win/pyenv-win)
	- 在windows power shell(管理员)运行
	  ```bash
	  # 设置PowerShell执行策略为允许
	  set-executionpolicy remotesigned
	  # 安装pyenv-win
	  Invoke-WebRequest -UseBasicParsing -Uri "https://raw.githubusercontent.com/pyenv-win/pyenv-win/master/pyenv-win/install-pyenv-win.ps1" -OutFile "./install-pyenv-win.ps1"; &"./install-pyenv-win.ps1"
	  #重新打开PowerShell，查看安装是否成功
	  pyenv --version
	  # 列出所有安装的python版本
	  pyenv versions
	  # 设置环境变量：
	  # PYTHON_BUILD_MIRROR_URL=https://jedore.netlify.app/tools/python-mirrors/
	  # 添加环境变量到PATH, 注意修改username:
	  # C:\Users\<username>\.pyenv\pyenv-win\versions\3.11.9-win32
	  # C:\Users\<username>\.pyenv\pyenv-win\versions\3.11.9-win32\libs
	  # 添加dll到vimrc
	  # let &pythonthreedll='C:\Users\<username>\.pyenv\pyenv-win\versions\3.11.9-win32\python3.dll'
	  # 执行: pyenv update
	  pyenv install 2.7.9-win32
	  pyenv install 3.11.9-win32
	  pyenv global 3.11.9-win32
	  python version
	  ```

## 最终的Vimrc
 ![[_vimrc]]

---

### 参考文献
1. [How I'm able to take notes in mathematics lectures using LaTeX and Vim](https://castel.dev/post/lecture-notes-1/)