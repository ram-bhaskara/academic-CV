%% long-CV.cls — Long-form academic CV
%% Libertine serif, two-tier headings, navy accent color.
%%
%% Usage: \documentclass{long-CV}
%% Compile with: pdflatex main.tex (twice for page numbers)
%%
%% Commands reference:
%%   Header:
%%     \cvname{Your Name}
%%     \cvemail{you@university.edu}
%%     \cvwebsite{yoursite.github.io}
%%
%%   Entries:
%%     \cventry{Institution}{Department}{Role}{Date}
%%     \cvedu{Institution}{Degree | Supervisor}{Date}
%%     \cvsimpleentry{Left text}{Right text}
%%
%%   Publications:
%%     \cvpub{Title}{Authors}{Venue}{URL}{Award note or {}}
%%     \cvpubreview{Title}{Authors}{Venue}
%%
%%   Talks:
%%     \cvtalktitle{Title}
%%     \cvtalkentry{Venue}{Note}{Location}{Date}  — pass {} to omit Note or Location
%%     \cvtalkend
%%
%%   Awards / Grants:
%%     \cvaward{Title}{Org}{Detail}{Year}{URL or {}}
%%     \cvgrant{Title}{Funder}{Detail}{Outcome}{Year}  — pass {} for Outcome if awarded
%%
%%   People:
%%     \cvstudent{Name}{Role}{Years}
%%
%%   News:
%%     \cvnews{Headline}{Source}{Date}
%%
%%   Author name shortcut (semibold weight):
%%     Define in main.tex: \renewcommand{\Me}{\cvme{Your Name}}
%%     Use in author lists: \Me, Coauthor One, Coauthor Two
%%
%%   Section headings:
%%     \section{Heading}       — bold 13pt, accent color (Appointments, Education)
%%     \sectionminor{Heading}  — bold small caps 11pt, black (all other sections)

\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{long-CV}

\LoadClass[10.5pt, letterpaper]{article}

\RequirePackage[margin=1in, top=0.85in, bottom=0.85in]{geometry}
\RequirePackage[T1]{fontenc}
\RequirePackage[semibold]{libertine}
\RequirePackage{amsmath}
\RequirePackage{fontawesome5}
\RequirePackage{microtype}
\RequirePackage{parskip}
\RequirePackage{titlesec}
\RequirePackage{enumitem}
\RequirePackage{hyperref}
\RequirePackage{xcolor}
\RequirePackage{tabularx}
\RequirePackage{array}
\RequirePackage{booktabs}
\RequirePackage{etoolbox}
\RequirePackage{fancyhdr}
\RequirePackage{lastpage}

\renewcommand{\familydefault}{\sfdefault}
\setlength{\parskip}{3pt}

%% -------------------------------------------------------
%% Colors
%% To change the accent color, update emailcolor and header1color.
%% -------------------------------------------------------
\definecolor{namecolor}        {HTML}{111111}
\definecolor{rulecolor}        {HTML}{AAAAAA}
\definecolor{linkcolor}        {HTML}{111111}
\definecolor{emailcolor}       {HTML}{1254a2}
\definecolor{header1color}     {HTML}{1254a2}
\definecolor{specialentrycolor}{HTML}{1254a2}

%% Semibold name macro — override in main.tex:
%%   \renewcommand{\Me}{\cvme{Your Name}}
\newcommand{\cvme}[1]{{\fontseries{sb}\selectfont #1}}
\newcommand{\Me}{\cvme{Your Name}}

\hypersetup{
  colorlinks = true,
  urlcolor   = emailcolor,
  linkcolor  = linkcolor,
}

\pagestyle{fancy}
\fancyhf{}
\renewcommand{\headrulewidth}{0pt}
\cfoot{\small\thepage\ / \pageref{LastPage}}

%% -------------------------------------------------------
%% Header — centered
%% -------------------------------------------------------
\newcommand{\cvname}   [1]{\def\@cvname{#1}}
\newcommand{\cvemail}  [1]{\def\@cvemail{#1}}
\newcommand{\cvwebsite}[1]{\def\@cvwebsite{#1}}

\renewcommand{\maketitle}{%
  \begin{center}
    {\fontsize{20}{24}\selectfont\bfseries\color{namecolor}\@cvname}\\[3pt]
    {\small%
      \href{mailto:\@cvemail}{\textcolor{black}{\@cvemail}}%
      \enspace\textbar\enspace
      {\hypersetup{urlcolor=emailcolor}\href{https://\@cvwebsite}{\@cvwebsite}}%
    }%
    \vspace{2pt}%
  \end{center}
}

%% -------------------------------------------------------
%% Section headings
%% -------------------------------------------------------
\titleformat{\section}{}{}{}{}

%% PRIMARY — bold 13pt, accent color — for Appointments, Education
\renewcommand{\section}[1]{%
  \vspace{9pt}%
  \noindent
  {\fontsize{13}{15.5}\selectfont\bfseries\color{header1color}#1}%
  \hspace{10pt}%
  {\color{rulecolor}\leaders\hrule height 0.35pt depth 0pt\hfill\kern0pt}%
  \par\vspace{4pt}%
}

%% SECONDARY — bold small caps 11pt, black — for all other sections
\newcommand{\sectionminor}[1]{%
  \vspace{9pt}%
  \noindent
  {\fontsize{11}{13}\selectfont\bfseries\scshape\color{namecolor}#1}%
  \hspace{10pt}%
  {\color{rulecolor}\leaders\hrule height 0.3pt depth 0pt\hfill\kern0pt}%
  \par\vspace{4pt}%
}

%% -------------------------------------------------------
%% Entry commands — all use \arraystretch{1} + \newline + \par\vspace{3pt}
%% -------------------------------------------------------

\newcommand{\cventry}[4]{%
  \noindent
  {\renewcommand{\arraystretch}{1}%
  \begin{tabularx}{\linewidth}{@{}X r@{}}
    \textbf{#1} & {\small #4} \\
    {\small #2}         &    \\
    {\small\textit{#3}} &
  \end{tabularx}}%
  \par\vspace{3pt}
}

\newcommand{\cvedu}[3]{%
  \noindent
  {\renewcommand{\arraystretch}{1}%
  \begin{tabularx}{\linewidth}{@{}X r@{}}
    \textbf{#1}%
    \ifx\relax#2\relax\else\newline{\small #2}\fi
    & {\small #3}
  \end{tabularx}}%
  \par\vspace{3pt}
}

\newcommand{\cvsimpleentry}[2]{%
  \noindent
  \begin{tabularx}{\linewidth}{@{}X r@{}}
    {\small #1} & {\small #2}
  \end{tabularx}%
  \par\vspace{3pt}
}

%% -------------------------------------------------------
%% Publication entries
%% -------------------------------------------------------

\newcommand{\cvpub}[5]{%
  \noindent
  \textbf{#1}\ifx\relax#4\relax\else~{\,\small\href{#4}{\faExternalLink*}}\fi\\[2pt]
  {\small\mdseries #2}\\[2pt]
  {\small\itshape%
    \ifx\relax#5\relax
      #3%
    \else
      #3\enspace\textbar\enspace\color{specialentrycolor}#5%
    \fi}%
  \par\vspace{3pt}
}

\newcommand{\cvpubreview}[3]{%
  \noindent
  #1\\[2pt]
  {\small\mdseries #2}%
  \ifx\relax#3\relax\else\\[2pt]{\small\itshape #3}\fi%
  \par\vspace{3pt}
}

%% -------------------------------------------------------
%% Talk entries
%% -------------------------------------------------------

\newcommand{\cvtalktitle}[1]{%
  \noindent\textbf{#1}\par\vspace{0pt}%
}

\newcommand{\cvtalkentry}[4]{%
  \noindent
  \begin{tabularx}{\linewidth}{@{}X r@{}}
    {\small #1\ifx\relax#2\relax\else\enspace\textbar\enspace\textit{#2}\fi}
    &
    {\small\ifx\relax#3\relax\else#3\enspace\textbar\enspace\fi\textit{#4}}
  \end{tabularx}\par\vspace{0pt}%
}

\newcommand{\cvtalkend}{\vspace{4pt}}

%% -------------------------------------------------------
%% Award entry
%% -------------------------------------------------------
\newcommand{\cvaward}[5]{%
  \noindent
  {\renewcommand{\arraystretch}{1}%
  \begin{tabularx}{\linewidth}{@{}X r@{}}
    \textbf{#1}\ifx\relax#5\relax\else~{\,\small\href{#5}{\faExternalLink*}}\fi
    \newline
    {\small #2\ifx\relax#3\relax\else\enspace\textbar\enspace\textit{#3}\fi}
    & {\small #4}
  \end{tabularx}}%
  \par\vspace{3pt}
}

%% -------------------------------------------------------
%% Grant / funding entry
%% -------------------------------------------------------
\newcommand{\cvgrant}[5]{%
  \noindent
  {\renewcommand{\arraystretch}{1}%
  \begin{tabularx}{\linewidth}{@{}X r@{}}
    \textbf{#1} & {\small\textit{#5}} \\
    {\small #2\ifx\relax#3\relax\else\enspace\textbar\enspace\textit{#3}\fi} &
    \ifx\relax#4\relax\else\\{\small\textit{#4}} & \fi
  \end{tabularx}}%
  \par\vspace{3pt}
}

%% -------------------------------------------------------
%% Student / Advisee entry
%% -------------------------------------------------------
\newcommand{\cvstudent}[3]{%
  \noindent
  {\renewcommand{\arraystretch}{1}%
  \begin{tabularx}{\linewidth}{@{}X r@{}}
    \textbf{#1}\newline{\small\textit{#2}} & {\small #3}
  \end{tabularx}}%
  \par\vspace{3pt}
}

%% -------------------------------------------------------
%% News / press entry
%% -------------------------------------------------------
\newcommand{\cvnews}[3]{%
  \noindent
  {\renewcommand{\arraystretch}{1}%
  \begin{tabularx}{\linewidth}{@{}X r@{}}
    #1\newline{\small #2} & {\small #3}
  \end{tabularx}}%
  \par\vspace{3pt}
}