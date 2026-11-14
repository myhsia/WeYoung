%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Copyright 2023 WeYoung [weyoung@hdu.edu.cn] %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% Designed by あしや [xiamy@hdu.edu.cn] %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%

%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ------------------- 初始化 ------------------- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{WYDaily}[2023/04/16 v1.0 WYDaily document class]

\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\SetupKeyvalOptions{family=ELEGANT, prefix=ELEGANT@, setkeys=\kvsetkeys}
\newcommand{\ekv}[1]{\kvsetkeys{ELEGANT}{#1}}
\DeclareStringOption[cn]{lang}
\DeclareStringOption{system}
\DeclareStringOption[ctexfont]{chinesefont}
\DeclareVoidOption{ctexfont}{\ekv{chinesefont=ctexfont}}
\DeclareVoidOption{founder}{\ekv{chinesefont=founder}}
\PassOptionsToPackage{no-math}{fontspec}
\PassOptionsToPackage{quiet}{fontspec}% 字体包警告解除
\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{book}}
\ProcessKeyvalOptions*\relax
\LoadClass[a4paper,oneside]{book}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% --------------------------------------------- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ----------------- 本文档命令 ----------------- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[a4paper, top=25.4mm, bottom=25.4mm, left=31.7mm, right=31.7mm, headheight=1.5cm, headsep=4mm, footskip=4mm]{geometry}% 页边矩设置 
\RequirePackage{enumitem}% 自动编号
\setenumerate{listparindent=2em,itemindent=4.5em,labelsep=0em,parsep=0em,topsep=0em,leftmargin=0em,label=（\arabic*）}
\RequirePackage{setspace}% 设置行间距
\RequirePackage{csquotes}
\RequirePackage{physics}% 称之为神包
\RequirePackage{fixdif}% 修复微分算符d的间距问题
\RequirePackage{esvect}% 矢量箭头
\RequirePackage{extarrows}
\RequirePackage{bm}% 矩阵加粗
\lineskiplimit=12pt % 行内公式行距限制
\lineskip=10.5pt % 行内公式行距控制
\newcommand{\biaosong}{\CJKfamily{zhbs}}
\newcommand\ee{\mathrm{e}}
\newcommand\ii{\mathrm{i}}
\DeclareRobustCommand\arcoth{\mathop{\operator@font arcoth}\nolimits}% 补充arcoth三角函数
\RequirePackage{tikz} %% load tikz without tikz
\usetikzlibrary{angles,backgrounds,calc,decorations.pathreplacing,fit,quotes,shadows,positioning}
\newcommand*\circled[1]{\tikz[baseline=(char.base)]{\node[shape=circle,draw,inner sep=1pt] (char) {#1};}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% --------------------------------------------- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ----------------- 超链接设置 ----------------- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{hyperref}
\hypersetup{pdfkeywords={WYDaily}, colorlinks, linkcolor=structurecolor, urlcolor=structurecolor}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% --------------------------------------------- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ------------------ 中文字体 ------------------ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\ifdefstring{\ELEGANT@system}{mac}{
    \ifdefstring{\ELEGANT@chinesefont}{founder}{
        \RequirePackage[UTF8,scheme=plain,fontset=mac]{ctex}}{\relax}
    \ifdefstring{\ELEGANT@chinesefont}{ctexfont}{
        \RequirePackage[UTF8,scheme=plain]{ctex}}{\relax}
}{\relax}
\ifdefstring{\ELEGANT@system}{windows}{
    \ifdefstring{\ELEGANT@chinesefont}{founder}{
        \RequirePackage[UTF8,scheme=plain,fontset=windows]{ctex}}{\relax}
    \ifdefstring{\ELEGANT@chinesefont}{ctexfont}{
        \RequirePackage[UTF8,scheme=plain]{ctex}}{\relax}
}{\relax}
\ifdefstring{\ELEGANT@system}{overleaf}{
    \ifdefstring{\ELEGANT@chinesefont}{founder}{
        \RequirePackage[UTF8,scheme=plain,fontset=ubuntu]{ctex}}{\relax}
    \ifdefstring{\ELEGANT@chinesefont}{ctexfont}{
        \RequirePackage[UTF8,scheme=plain]{ctex}}{\relax}
}{\relax}
\setCJKfamilyfont{zhbs}{FZXiaoBiaoSong-B05S}[Extension =.ttf]
\AfterEndPreamble{\setlength\parindent{2\ccwd}}% 控制自动缩进2格
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% --------------------------------------------- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ---------------- 封面信息寻址 ---------------- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\subtitle}[1]{\gdef\@subtitle{#1}}
\newcommand{\editor}[1]{\gdef\@editor{#1}}
\newcommand{\process}[1]{\gdef\@process{#1}}
\newcommand{\processn}[1]{\gdef\@processn{#1}}
\newcommand{\cover}[1]{\gdef\@cover{#1}}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% --------------------------------------------- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% --------------- 绘图 & 数学字体 --------------- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{graphicx}
\graphicspath{{./figure/}{./figures/}{./image/}{./images/}{./graphics/}{./graphic/}{./pictures/}{./picture/}}% 便于includegraphics寻址
\RequirePackage{amsmath,mathrsfs,amsfonts,amssymb}
\RequirePackage{booktabs}
\RequirePackage{makecell,lipsum,hologo}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% --------------------------------------------- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ------------------ 章节设置 ------------------ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage[center,pagestyles]{titlesec}
\RequirePackage[title,titletoc,header]{appendix}
\titleformat{\chapter}{\biaosong\large}{}{}{\filcenter\color{structurecolor}\filcenter}
\titlespacing{\chapter}{0pt}{-20pt}{1.3\baselineskip}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% --------------------------------------------- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ------------------- 子章节 ------------------- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
  \renewcommand{\baselinestretch}{1.3}
  \newcommand{\authorname}{\kaishu 主编：}
  \newcommand{\editorname}{\kaishu 编辑：}
  \newcommand{\processname}{\kaishu 审核：}
  \newcommand{\processnname}{\kaishu \quad\quad\quad}
  \newcommand{\institutename}{\kaishu 组织：}
  \newcommand{\datename}{\kaishu 时间：}
  \newcommand{\versionname}{\kaishu 版本：}
  \newcommand{\designname}{\kaishu 设计：}
  \newcommand{\refername}{参考资料：}
  \newcommand{\exercisename}{题目：}
  \newcommand{\teachername}{讲师：}
  \newcommand{\postdatename}{时间：}
  \newcommand{\resultname}{参考答案：}
  \newcommand{\analysisname}{分析：}
  \newcommand{\remarkname}{注：}
  \newcommand{\solutionname}{解答：}
  \newcommand{\solutionstname}{解法一：}
  \newcommand{\solutionndname}{解法二：}
  \newcommand{\solutionrdname}{解法三：}
  \renewcommand*{\proofname}{证明：}
  \newcommand{\pointname}{知识点：}
% 引用上方
\newcommand\formula[1]{\par\centerline{$ #1 $}}
  \newcommand\refer[1]{\vspace{-2.625em}\par\textbf{\refername}#1}
  \newcommand\exercise[1]{\par\textbf{\exercisename}#1}
  \newcommand\teacher[1]{\par\textbf{\teachername}#1}
  \newcommand\postdate[1]{\par\textbf{\postdatename}#1}
  \newcommand\result[1]{\par\textbf{\resultname}$ #1 $}
  \newcommand\bigresult[1]{\par\textbf{\resultname}#1}
  \newcommand\analysis[1]{\par\textbf{\analysisname}#1}
  % \newcommand\ianalysis[1]{\par\qquad\textbf{\analysisname}#1}
  \newcommand\solution[1]{\par\textbf{\solutionname}#1}
  \newcommand\solutionst[1]{\par\textbf{\solutionstname}#1}
  \newcommand\solutionnd[1]{\par\textbf{\solutionndname}#1}
  \newcommand\solutionrd[1]{\par\textbf{\solutionrdname}#1}
  \newcommand\proof[1]{\par\textbf{\proofname}#1\hfill\ensuremath{\square}}
  \newcommand\point[1]{\par\textbf{\pointname}#1}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% --------------------------------------------- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ------------------ 页眉页脚 ------------------ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\RequirePackage{fancyhdr}
\fancypagestyle{plain}{\pagestyle{fancy}}
\pagestyle{fancy}
\fancyfoot[C]{\color{structurecolor}\small\thepage}
\fancyhead[L]{\color{structurecolor}\kaishu{\,\href{http://weixin.qq.com/r/DBIABcHEqgnWKIVmb0eI}{微信公众号：WY未央学社}}}
\fancyhead[R]{\color{structurecolor}\kaishu{\href{https://jq.qq.com/?_wv=1027&k=ox7TFNCn}{「未央学社」HDU数学营：682906443}}\,}
\renewcommand{\headrule}{\color{structurecolor}\hrule width\textwidth}
\renewcommand{\headrulewidth}{1pt}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% --------------------------------------------- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% ------ 封面页设计 Copyright@ElegantLaTeX ------ %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\renewcommand*{\maketitle}{%
\everymath{\displaystyle}% 行间公式
\hypersetup{pageanchor=false}
\pagenumbering{Alph}
\begin{titlepage}
  \newgeometry{margin = 0in}
  \parindent=0pt
  \includegraphics[width=\linewidth]{\@cover}\vspace{-1.05em}
  \setlength{\fboxsep}{0pt}
  \colorbox{coverlinecolor}{\makebox[\linewidth][c]{\shortstack[c]{\vspace{0.5in}}}}
  \vfill
  \vskip-2ex
  \hspace{2em}
  \parbox{0.8\textwidth}{\biaosong\Huge\@title\par}
  \vfill
  \vspace{-1.0cm}
  \setstretch{2.5}
  \hspace{2.5em}
  \begin{minipage}[c]{0.67\linewidth}
    {\color{darkgray}\bfseries\Large\@subtitle\\[2ex]}
    \color{gray}\normalsize
    {\renewcommand{\arraystretch}{0.618}
    \begin{tabular}{l}
      \authorname\kaishu\@author\\
      \editorname\kaishu\@editor\\
      \processname\kaishu\@process\\
      \processnname\kaishu\@processn\\
      \kaishu\institutename 未央学社\\
      \kaishu 设计：Axia\quad\href{https://github.com/ElegantLaTeX/ElegantBook}{Elegant\LaTeX 项目组}
    \end{tabular}
    }
  \end{minipage}
  \begin{minipage}[c]{0.27\linewidth}
    \includegraphics[width=4.2cm]{figure/WY Logo.pdf}
  \end{minipage}
  \vfill
  \begin{center}
    \setstretch{1.3}
    \parbox[t]{0.7\textwidth}{\centering\kaishu{欢迎关注\href{http://weixin.qq.com/r/DBIABcHEqgnWKIVmb0eI}{微信公众号：WY未央学社}\\\href{https://jq.qq.com/?_wv=1027&k=ox7TFNCn}{「未央学社」HDU数学营：682906443}}}
  \end{center}
  \vfill
\end{titlepage}
\restoregeometry
\mainmatter
}
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% --------------------------------------------- %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%
\newcommand{\watermark}[1]{\RequirePackage{wallpaper}\CenterWallPaper{0.5}{#1}}