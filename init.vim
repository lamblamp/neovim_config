"
" ----------------------------------------------------------
" 基本
" ----------------------------------------------------------
let mapleader=","                          " キーマップリーダー
set scrolloff=5                            " スクロール時の余白
set nowrap                                 " 自動折り返しなし
set nobackup                               " バックアップなし
set autoread                               " 他で更新されたら自動で読み直し
set noswapfile                             " スワップファイルなし
set noundofile                             " UNDOファイルなし
set hidden                                 " 編集中でも他のファイルを開けるようにする
set backspace=indent,eol,start             " バックスペースでなんでも消せるようにする
set formatoptions=lmoq                     " テキスト整形オプションにマルチバイト系を追加
set vb t_vb=                               " ビープなし
set browsedir=buffer                       " Exploreの初期ディレクトリ
set whichwrap=b,s,h,l,<,>,[,]              " カーソルを行頭、行末で止まらないようにする
set showcmd                                " コマンドをステータス行に表示
set viminfo='50,<1000,s100,\"50            " viminfoファイルの設定
set modelines=0                            " モードラインは無効
" ターミナルでマウスを使用できるようにする
set mouse=a
set guioptions+=a

" 矩形選択で自由に移動する
set virtualedit+=block

command! Ev edit $MYVIMRC



" ----------------------------------------------------------
" レジスタ
" ----------------------------------------------------------
" OSのクリップボードを使用する
set clipboard+=unnamed
" ヤンクした文字は、システムのクリップボードに入れる
set clipboard=unnamed
" 挿入モードでCtrl+pを押すとクリップボードの内容を貼り付けられるようにする
imap <C-p> <ESC>"*pa
" ビジュアルモードでCtrl+pを押すと０レジスタの内容を貼り付ける
vnoremap <silent> <C-p> "0p<CR>
" カーソル位置の単語をyankする
nnoremap vy vawy


" ----------------------------------------------------------
" ステータスライン
" ----------------------------------------------------------
set laststatus=2                           " 常にステータスラインを表示
set ruler                                  " カーソルが何行目の何列目におかれているかを表示する


" ----------------------------------------------------------
" 表示
" ----------------------------------------------------------
set number
set showmatch
set list
set listchars=tab:>\ \,trail:_,extends:>,precedes:< " 不可視文字の表示景色
set display=uhex                                    " 印字不可能文字を16進数で表示
set cmdheight=2                                     " コマンドライン行数を2行に

" 全角スペースの表示
"scriptencoding cp932
"highlight ZenkakuSpace cterm=underline ctermfg=Blue guibg=Gray
"match ZenkakuSpace /　/

" カーソル行をハイライト
set cursorline

" カレントウィンドウのみの罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END


" ----------------------------------------------------------
" カラー
" ----------------------------------------------------------
syntax on
set termguicolors
colorscheme desert


" ----------------------------------------------------------
" インデント
" ----------------------------------------------------------
set autoindent
set smartindent

" softtabstopはTabキー押し下げ字の挿入される空白の量、0の場合はtabstopと同じ、BSにも影響する
set noexpandtab
set tabstop=4 shiftwidth=4 softtabstop=0


" ----------------------------------------------------------
" 補完・履歴
" ----------------------------------------------------------
inoremap { {}<LEFT>
inoremap [ []<LEFT>
inoremap ( ()<LEFT>


" ----------------------------------------------------------
" ディレクトリ操作
" ----------------------------------------------------------

" 開いているバッファへカレントディレクトリを移動
autocmd BufEnter * execute ":lcd " . expand("%:p:h")


" ----------------------------------------------------------
" タグ操作
" ----------------------------------------------------------



" ----------------------------------------------------------
" 検索
" ----------------------------------------------------------
set wrapscan                               " 最後まで検索したら先頭へ戻る
set ignorecase                             " 大文字小文字無視
set smartcase                              " 検索文字列に大文字が含まれている場合は区別して検索する
set incsearch                              " インクリメンタルサーチ
set hlsearch                               " 検索文字をハイライト
" Escの2回押しでハイライト消去
nmap <Esc><Esc> :nohlsearch<CR><Esc>


" ----------------------------------------------------------
" 移動
" ----------------------------------------------------------
nnoremap h <Left>
nnoremap j gj
nnoremap k gk
nnoremap l <Right>
nnoremap <Down> gj
nnoremap <Up> gk

" 0,-で行頭、行末へ
" 0で^と0をトグルする
nnoremap <expr> 0
\  match(strpart(getline('.'), 0, col('.') - 1), '^\s\+$') >= 0 ? '0' : '^'
nmap ` $

" insert modeでの移動
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>

" <space>j, <space>kで画面送り
nnoremap <Space>j <C-f>
nnoremap <Space>k <C-b>
" <Ctrl>+hjklでウィンドウの移動
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l


" ----------------------------------------------------------
" エンコーディング
" ----------------------------------------------------------
set fileencodings=utf-8,cp932


" ----------------------------------------------------------
" 編集
" ----------------------------------------------------------
set noimdisable
set iminsert=0 imsearch=0
set noimcmdline
inoremap <silent> <Esc> <Esc>:set iminsert=0<CR>

let g:win_ime_con_mode=0




" ----------------------------------------------------------
" バッファ操作
" ----------------------------------------------------------
map <F1> :<C-u>Denite buffer -split=vertical -winwidth=40 -direction=topleft<CR>

nnoremap <Leader>he :tab help<CR>

" ヘルプはqで閉じる
autocmd FileType help nnoremap <buffer> q <C-w>c
" QuickFixはqで閉じる
autocmd FileType qf nnoremap <buffer> q <C-w>c



" ----------------------------------------------------------
" Ptython
" ----------------------------------------------------------
let g:python3_host_prog='C:\Users\K544202\AppData\Local\Programs\Python\Python310\python.exe'




" ----------------------------------------------------------
" プラグイン
" ----------------------------------------------------------
" dein
if &compatible
  set nocompatible
endif
" dein
let s:dein_dir = expand('C:\Users\K544202\.cache\dein.vim')
let s:toml_dir = expand('C:\Users\K544202\AppData\Local\nvim')

if match( &runtimepath, '/dein.vim')
  execute 'set runtimepath+=' . s:dein_dir
endif

call dein#begin(s:dein_dir)


let s:toml = s:toml_dir . '/dein.toml'
let s:lazy_toml = s:toml_dir . '/dein_lazy.toml'
call dein#load_toml(s:toml, {'lazy': 0})
call dein#load_toml(s:lazy_toml, {'lazy': 1})

call dein#end()


filetype plugin indent on
syntax enable


" ----------------------------------------------------------
" ハイライト修正
" ----------------------------------------------------------
highlight Pmenu ctermfg=0 ctermbg=13 guibg=Green
"highlight clear cursorline
"highlight cursorline gui=underline
"highlight curosrline ctermbg=black guibg=black
