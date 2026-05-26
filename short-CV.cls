%% short-CV.cls — Two-page faculty CV
%% Derived from short-CV.cls with tighter spacing throughout.
%% Base: 10pt, margins 0.7in/0.85in, parskip 1pt.

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{short-CV}

\LoadClass[10pt, letterpaper]{article}

\RequirePackage[top=0.70in, bottom=0.70in, left=0.85in, right=0.85in]{geometry}
\RequirePackage[T1]{fontenc}
\RequirePackage[semibold]{libertine}
\RequirePackage{amsmath}
\RequirePackage{fontawesome5}
\RequirePackage{microtype}
\RequirePackage{parskip}
\RequirePackage{titlesec}
\RequirePackage{hyperref}
\RequirePackage{xcolor}
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

\renewcommand{\familydefault}{\sfdefault}
\setlength{\parskip}{1pt}

%% Colors
\definecolor{namecolor}        {HTML}{111111}
\definecolor{rulecolor}        {HTML}{AAAAAA}
\definecolor{emailcolor}       {HTML}{1254a2}
\definecolor{header1color}     {HTML}{1254a2}
\definecolor{specialentrycolor}{HTML}{1254a2}

\newcommand{\cvme}[1]{{\fontseries{sb}\selectfont #1}}
\newcommand{\Me}{\cvme{Levi Ackerman}}

\hypersetup{colorlinks=true, urlcolor=emailcolor, linkcolor=emailcolor}

\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\cfoot{\small\thepage\ / \pageref{LastPage}}

%% -------------------------------------------------------
%% Header
%% -------------------------------------------------------
\newcommand{\cvname}   [1]{\def\@cvname{#1}}
\newcommand{\cvemail}  [1]{\def\@cvemail{#1}}
\newcommand{\cvwebsite}[1]{\def\@cvwebsite{#1}}

\renewcommand{\maketitle}{%
  \begin{center}
    {\fontsize{18}{22}\selectfont\bfseries\color{namecolor}\@cvname}\\[2pt]
    {\small
      \href{mailto:\@cvemail}{\textcolor{black}{\@cvemail}}%
      \enspace\textbar\enspace
      {\hypersetup{urlcolor=emailcolor}\href{https://\@cvwebsite}{\@cvwebsite}}%
    }
    \vspace{6pt}
  \end{center}
}

%% -------------------------------------------------------
%% Section headings — tighter pre/post spacing
%% -------------------------------------------------------
\titleformat{\section}{}{}{}{}

\renewcommand{\section}[1]{%
  \vspace{6pt}%
  \noindent
  {\fontsize{11.5}{14}\selectfont\bfseries\color{header1color}#1}%
  \hspace{8pt}%
  {\color{rulecolor}\leaders\hrule height 0.35pt depth 0pt\hfill\kern0pt}%
  \par\vspace{5pt}%
}

\newcommand{\sectionminor}[1]{%
  \vspace{6pt}%
  \noindent
  {\fontsize{10}{12}\selectfont\bfseries\scshape\color{namecolor}#1}%
  \hspace{8pt}%
  {\color{rulecolor}\leaders\hrule height 0.3pt depth 0pt\hfill\kern0pt}%
  \par\vspace{2pt}%
}

%% -------------------------------------------------------
%% \cventry{Institution}{Dept}{Role}{Date} — tight rows
%% -------------------------------------------------------
\newcommand{\cventry}[4]{%
  \noindent
  {\renewcommand{\arraystretch}{1}%
  \begin{tabularx}{\linewidth}{@{}X r@{}}
    \textbf{#1} & {\small #4} \\
    {\small #2} & \\[-1pt]
    {\small\textit{#3}} &
  \end{tabularx}}%
  \par\vspace{2pt}
}

%% \cvedu{Institution}{Degree}{Date}
\newcommand{\cvedu}[3]{%
  \noindent
  {\renewcommand{\arraystretch}{1}%
  \begin{tabularx}{\linewidth}{@{}X r@{}}
    \textbf{#1}%
    \ifx\relax#2\relax\else\newline{\small #2}\fi
    & {\small #3}
  \end{tabularx}}%
  \par\vspace{2pt}
}

%% \cvsimpleentry{Left}{Right}
\newcommand{\cvsimpleentry}[2]{%
  \noindent
  \begin{tabularx}{\linewidth}{@{}X r@{}}
    {\small #1} & {\small #2}
  \end{tabularx}%
  \par\vspace{2pt}
}

%% -------------------------------------------------------
%% \cvpubshort — compact single-block publication
%% Authors. \textit{Title}. Venue. [icon]
%% No separate rows — wraps naturally, very compact.
%% -------------------------------------------------------
\newcommand{\cvpubshort}[4]{%
  % #1 authors  #2 title  #3 venue  #4 url
  \noindent
  {\small #1. \textit{#2}. #3.%
  \ifx\relax#4\relax\else~{\,\href{#4}{\faExternalLink*}}\fi}%
  \par\vspace{2pt}
}

%% \cvpubshortaward — same but with award note in accent color
\newcommand{\cvpubshortaward}[5]{%
  % #1 authors  #2 title  #3 venue  #4 url  #5 award
  \noindent
  {\small #1. \textit{#2}. #3\ifx\relax#5\relax\else~{\color{specialentrycolor}(#5)}\fi.%
  \ifx\relax#4\relax\else~{\,\href{#4}{\faExternalLink*}}\fi}%
  \par\vspace{2pt}
}

%% \cvpubreviewshort — under review, no link
\newcommand{\cvpubreviewshort}[3]{%
  \noindent
  {\small #1. \textit{#2}\ifx\relax#3\relax\else. #3\fi.}%
  \par\vspace{2pt}
}

%% -------------------------------------------------------
%% Award entry — tight
%% -------------------------------------------------------
\newcommand{\cvaward}[5]{%
  \noindent
  {\renewcommand{\arraystretch}{0.92}%
  \begin{tabularx}{\linewidth}{@{}X r@{}}
    \textbf{#1}\ifx\relax#5\relax\else~{\,\small\href{#5}{\faExternalLink*}}\fi
    \newline
    {\small #2\ifx\relax#3\relax\else\enspace\textbar\enspace\textit{#3}\fi}
    & {\small #4}
  \end{tabularx}}%
  \par\vspace{2pt}
}

%% -------------------------------------------------------
%% Grant entry — tight
%% -------------------------------------------------------
\newcommand{\cvgrant}[5]{%
  \noindent
  {\renewcommand{\arraystretch}{0.92}%
  \begin{tabularx}{\linewidth}{@{}X r@{}}
    \textbf{#1} & {\small\textit{#5}} \\
    {\small #2\ifx\relax#3\relax\else\enspace\textbar\enspace\textit{#3}\fi} &
    \ifx\relax#4\relax\else\\[0pt]{\small\textit{#4}} & \fi
  \end{tabularx}}%
  \par\vspace{2pt}
}

%% -------------------------------------------------------
%% Talk entries — tight
%% -------------------------------------------------------
\newcommand{\cvtalktitle}[1]{%
  \noindent\textbf{\small #1}\par\vspace{0pt}%
}

\newcommand{\cvtalkentry}[4]{%
  \noindent
  \begin{tabularx}{\linewidth}{@{}X r@{}}
    {\small #1\ifx\relax#2\relax\else\enspace\textbar\enspace\textit{#2}\fi}
    &
    {\small\ifx\relax#3\relax\else#3\enspace\textbar\enspace\fi\textit{#4}}
  \end{tabularx}\par\vspace{1pt}%
}

\newcommand{\cvtalkend}{\vspace{2pt}}