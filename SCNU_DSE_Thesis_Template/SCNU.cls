% Author: Yang Liu
% Email: blueloveTH@foxmail.com
% License: LaTeX Project Public License v1.3c

\ProvidesClass{cucthesis}[2021/02/23 v0.1 Thesis Class of Communication University of China]
\NeedsTeXFormat{LaTeX2e}

\RequirePackage{kvoptions}
\RequirePackage{etoolbox}
\RequirePackage{calc}


\SetupKeyvalOptions{family=CUC, prefix=CUC@, setkeys=\kvsetkeys}
\newcommand{\ckv}[1]{\kvsetkeys{CUC}{#1}}

\DeclareDefaultOption{\PassOptionsToClass{\CurrentOption}{article}}
\ProcessKeyvalOptions*\relax
\LoadClass{article}

% 设置纸张格式
\RequirePackage[
  a4paper,
  left=3cm,right=2.5cm,top=2.5cm,bottom=2.5cm,
  headheight=10cm,
  headsep=0.3cm]{geometry}
\setlength{\headsep}{0.6cm}

\RequirePackage{amsthm,amsmath,amssymb,indentfirst,booktabs,multicol,multirow,xcolor,graphicx,fancyhdr,hologo}

% 设置目录与引用的超链接（需要编译多次）
\RequirePackage{hyperref}
\hypersetup{
  pdfborder={0 0 0},
  colorlinks=false,linkcolor={blue},urlcolor={blue},filecolor={blue},citecolor={blue},
  linktoc=all,
}

%%%%%%%%%%%%%%%%%%%%%% 字体与段落 %%%%%%%%%%%%%%%%%%%%%%

\PassOptionsToPackage{no-math}{fontspec}
\RequirePackage[UTF8,scheme=plain]{ctex}
\setmainfont{Times New Roman}

% 1.25倍行距
\linespread{1.25}


% 段落缩进2字符
\setlength\parindent{2\ccwd}

%%%%%%%%%%%%%%%%%%%%%% 引用格式 %%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{gbt7714}
\bibliographystyle{gbt7714-numerical}
\setlength{\bibsep}{0.0pt}
\def\bibfont{\zihao{5}}
\renewcommand\refname{参考文献}

\renewcommand\figurename{图}
\renewcommand\tablename{表}

\RequirePackage{caption}
\DeclareCaptionLabelSeparator{onespace}{~~}
\captionsetup[table]{skip=8pt,labelsep=onespace}
\captionsetup[figure]{skip=8pt,labelsep=onespace}

\renewcommand{\captionfont}{\songti\zihao{5}}

% 图表与公式编号
\counterwithin{figure}{section}
\counterwithin{table}{section}
\counterwithin{equation}{section}
\renewcommand{\thefigure}{\arabic{section}-\arabic{figure}}
\renewcommand{\thetable}{\arabic{section}-\arabic{table}}
\renewcommand{\theequation}{\arabic{section}-\arabic{equation}}

%%%%%%%%%%%%%%%%%%附录%%%%%%%%%%%%%%%%%%%%%
% ——————————————————自带——————————————————
\newcommand{\appendixformat}{
  \renewcommand\figurename{附图}
  \renewcommand\tablename{附表}
  \renewcommand{\thefigure}{\arabic{figure}}
  \renewcommand{\thetable}{\arabic{table}}
}
% ————————————————————自带——————————————————

\newcounter{appendixsection} % 定义一个新的计数器
\renewcommand{\theappendixsection}{附录 \arabic{appendixsection}} % 设置附录节的编号格式

\newenvironment{appendices}{
  \clearpage
  \setcounter{appendixsection}{0} % 重置附录计数器
  \section*{附录} % 附录的标题
  \addcontentsline{toc}{section}{附录} % 在目录中添加“附录”条目
}{}

\newcommand{\appendixsection}[1]{%
  \refstepcounter{appendixsection} % 递增计数器
  \subsection*{\theappendixsection: #1} % 附录节的标题
  \addcontentsline{toc}{subsection}{\theappendixsection: #1} % 在目录中添加附录节
}

%%%%%%%%%%%%%%%%%%%%%%%% 致谢 %%%%%%%%%%%%%%%%%%%%%%

\newenvironment{acknowledgement}{
  \clearpage\phantomsection
  \begin{center}
    \vspace*{-10pt}
    % \zihao{2} 是二号字，\heiti 是黑体，\bfseries 是加粗
    \zihao{2}\heiti\bfseries{致\hphantom{空空}谢} 
    \vspace{8pt}
  \end{center}
  \addcontentsline{toc}{section}{致谢} 
  \zihao{-4}\songti\ignorespaces       % 正文通常维持小四号宋体
}{\clearpage}

%%%%%%%%%%%%%%%%%%%%%% code style %%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{listings}

\definecolor{codegreen}{rgb}{0,0.6,0}
\definecolor{codegray}{rgb}{0.5,0.5,0.5}
\definecolor{codepurple}{rgb}{0.58,0,0.82}

\lstdefinestyle{defaultstyle}{
    commentstyle=\color{codegreen},
    keywordstyle=\color{magenta},
    numberstyle=\tiny\color{codegray},
    stringstyle=\color{codepurple},
    basicstyle=\ttfamily\footnotesize,
    breaklines=true,
    keepspaces=true,
    tabsize=2,
    frame=single,
}

\lstset{style=defaultstyle}

%%%%%%%%%%%%%%%%%%%%%% 摘要与关键词 %%%%%%%%%%%%%%%%%%%%%%

% 中文摘要命令
\renewenvironment{abstract}{
  \clearpage\phantomsection
  \begin{center}
    \vspace*{-10pt}
    \zihao{3}\heiti{中文摘要}

    \vspace{8pt}
  \end{center}

  \addcontentsline{toc}{section}{中文摘要}
  \zihao{-4}\ignorespaces
}{\clearpage}

\newcommand{\keywords}[1]{\newline\newline\noindent\heiti{关键词：}\songti #1}

% 英文摘要命令
\newenvironment{abstractEN}{
  \clearpage\phantomsection
  \begin{center}
    \vspace*{-10pt}
    \zihao{3}\textbf{\heiti{ABSTRACT}}
    
    \vspace{8pt}
  \end{center}

  \addcontentsline{toc}{section}{ABSTRACT}
  \zihao{4}\ignorespaces
}{\clearpage}

\newcommand{\keywordsEN}[1]{\newline\newline\noindent\textbf{Keywords:\quad}#1}

%%%%%%%%%%%%%%%%%%%%%% 章节标题样式 %%%%%%%%%%%%%%%%%%%%%%

\RequirePackage{setspace,titlesec,zhnumber,titletoc}

%\renewcommand{\thesection}{第 \arabic{section} 章 \hphantom{空}}
\renewcommand{\thesection}{ \arabic{section} \hphantom{空}}
\renewcommand{\thesubsection}{\arabic{section}.\arabic{subsection}\hphantom{空}}
\renewcommand{\thesubsubsection}{\arabic{section}.\arabic{subsection}.\arabic{subsubsection}}

\newcommand{\sectionbreak}{\clearpage}
\titleformat{\section}[block]{\vspace*{-10pt} \centering \zihao{3} \heiti}
{\thesection}{0pt}{\vspace{8pt}}

\titleformat{\subsection}{\zihao{4} \heiti}
{\thesubsection}{0pt}{}

\titleformat{\subsubsection}{\zihao{-4} \heiti}
{\thesubsubsection.~~}{0pt}{}

%%%%%%%%%%%%%%%%%%%%%% 目录样式 %%%%%%%%%%%%%%%%%%%%%%

\renewcommand\contentsname{\heiti \centering \zihao{3} 目~~~~录}

\titlecontents{section}[0pt]{\bfseries \songti \zihao{-4}}
{\thecontentslabel}{}
{\titlerule*[0.7em]{.}\contentspage}

\titlecontents{subsection}[1\ccwd]{\songti \zihao{-4}}
{\thecontentslabel}{}
{\titlerule*[0.7em]{.}\contentspage}

\titlecontents{subsubsection}[3\ccwd]{\songti \zihao{-4}}
{\thecontentslabel.~~}{}
{\titlerule*[0.7em]{.}\contentspage}


%%%%%%%%%%%%%%%%%%%%%% 命令封装 %%%%%%%%%%%%%%%%%%%%%%

\newenvironment{references}{\clearpage\phantomsection\addcontentsline{toc}{section}{参考文献}}{\clearpage}


\fancypagestyle{CUCThesisMain}{
    \fancyhf{}
    \cfoot{\songti\zihao{-5}{\thepage}}
    \renewcommand{\headrulewidth}{0pt}
}


\newcommand{\contentpage}{
  \begin{spacing}{1.5}
    \tableofcontents
  \end{spacing}

  \clearpage

  % --- 同时保留图片和标题 ---
  \chead{\zihao{5}\ziju{0.08}\songti{\yourTitle}}
  \rhead{\includegraphics[width=1cm]{yemei.png}}
  
  
  % 隐藏默认的页眉黑线（因为图片通常自带装饰效果）
  \renewcommand{\headrulewidth}{1.0pt} 
  % -----------------------

  \pagenumbering{arabic}
  \setcounter{page}{1}
}

\newcommand{\nonumsection}[1]{
  \clearpage\phantomsection
  \section*{#1}
  \stepcounter{section}
  \addcontentsline{toc}{section}{#1}
}



%%%%%%%%%%%%%%%%%%%%%% 封面 %%%%%%%%%%%%%%%%%%%%%%

\newcommand{\dunderline}[3][-6pt]{{
  \setbox0=\hbox{#3}
  \ooalign{\copy0\cr\rule[\dimexpr#1-#2\relax]{\wd0}{#2}}
}}

%\newcommand{\infobox}[2]{
%    \hspace{2.4cm}\songti\zihao{-3}\textbf{\selectfont{#1~\dunderline{1pt}{\makebox[8cm][c]{#2}}}}
%}

\newcommand{\infobox}[2]{
	% 1. 将左侧缩进从 2.4cm 缩小到 0.8cm，为右侧题目留出更多空间
	\hspace{0.8cm}\songti\zihao{-3}\textbf{\selectfont{#1~%
			% 2. 将 \makebox 的宽度从 8cm 增加到 11.5cm，确保长题目能在一行内放下
			\dunderline{1pt}{\makebox[11.5cm][c]{#2}}}}
}


\newcommand{\coverpage}{
  \begin{titlepage}
    \vspace*{-10pt}
  
    \vspace*{2\ccwd}
    
  {\centering
  	\includegraphics[scale=1.8]{south_china_normal_university_icon.png}\par}

    \vspace{1.2cm}% <--- 在这里添加这一行，数值可以根据视觉效果自行调整

   {\centering
   	\hspace{1.5cm}
   	\zihao{-0}\heiti\bfseries\ziju{0.5}{本科毕业论文}\par} 
   % \ziju{0.2} 表示在原有字距基础上增加 0.2 倍间距
   
    
    
%    \zihao{-0}\textbf{\songti{华南师范大学}}
%    % \includegraphics{south_china_normal_university_icon.jpg}
%    \centering
%    \zihao{-0}\textbf{\songti{Linux\hphantom{空}课\hphantom{空}程\hphantom{空}论\hphantom{空}文}}
    % \vspace{0.6cm}
  
    % \zihao{-2}\textbf{\heiti\thesisTitle}
    \vspace{4.5cm}
  
    \flushleft
  
    \begin{spacing}{1.9}
      
        % \infobox{论文题目：}{\hspace{2cm}\yourTitle}
%        \infobox{论文题目：}{\hspace{3cm}\dunderline{1pt}{\yourTitle}}
		 \infobox{论文题目：}{\yourTitle}
		 
        \infobox{指导老师：}{\yourTeacher}

        \infobox{学生姓名：}{\yourName}

        \infobox{学\hphantom{空白}号：}{\studentID}

        \infobox{学\hphantom{空白}院：}{\yourDept}
  
        \infobox{专\hphantom{空白}业：}{\yourMajor}

%        \infobox{毕业时间：}{\songti{\zhtoday}}
        \infobox{毕业时间：}{\songti{2026年7月}}

    \end{spacing}
  
    \vspace{3cm}

    \centering
    % \zihao{-2}\ziju{0.5}\textbf{\songti{华南师范大学}}
  
    \centering
%    \zihao{-2}\ziju{0.5}\textbf{\songti{\zhtoday \hphantom{空}制}}
  \end{titlepage}
  
  \pagestyle{CUCThesisMain}
  \pagenumbering{Roman}
  \setcounter{page}{1}
}


%%%%%%%%%%%%%%%%%%%%%% JavaScript语法高亮支持 %%%%%%%%%%%%%%%%%%%%%%

\usepackage{color}
\definecolor{lightgray}{rgb}{.9,.9,.9}
\definecolor{darkgray}{rgb}{.4,.4,.4}
\definecolor{purple}{rgb}{0.65, 0.12, 0.82}

\lstdefinelanguage{JavaScript}{
  keywords={typeof, new, true, false, catch, function, return, null, catch, switch, var, if, in, while, do, else, case, break, const},
  keywordstyle=\color{blue}\bfseries,
  ndkeywords={class, export, boolean, throw, implements, import, this, async},
  ndkeywordstyle=\color{darkgray}\bfseries,
  identifierstyle=\color{black},
  sensitive=false,
  comment=[l]{//},
  morecomment=[s]{/*}{*/},
  commentstyle=\color{purple}\ttfamily,
  stringstyle=\color{red}\ttfamily,
  morestring=[b]',
  morestring=[b]"
}