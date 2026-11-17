%% bioRxiv Word-template-inspired Overleaf class
%% Faithful typographic recreation of chrelli/bioRxiv-word-template
%% Not an official bioRxiv document class.
%% Copyright (c) 2026, adaptation prepared for this Overleaf project.
%% Compile with XeLaTeX (or LuaLaTeX).
\NeedsTeXFormat{LaTeX2e}
\ProvidesClass{biorxiv-chrelli}[2026/11/17 v1.4 simplified bioRxiv Chrelli-style preprint]
\LoadClass[10pt,a4paper,twocolumn]{article}

% -----------------------------------------------------------------------------
% Dependencies
% -----------------------------------------------------------------------------
\RequirePackage{iftex}
\ifPDFTeX
  \ClassError{biorxiv-chrelli}{Use XeLaTeX or LuaLaTeX}{Choose XeLaTeX in Overleaf's Menu > Compiler.}
\fi
\RequirePackage{fontspec}
\RequirePackage{unicode-math}
\RequirePackage{geometry}
\RequirePackage{xcolor}
\RequirePackage{graphicx}
\RequirePackage{fancyhdr}
\RequirePackage{titlesec}
\RequirePackage{caption}
\RequirePackage{microtype}
\RequirePackage{enumitem}
\RequirePackage{amsmath}
\RequirePackage{booktabs}
\RequirePackage{array}
\RequirePackage{hyperref}
\RequirePackage[numbers,square,sort&compress]{natbib}
\RequirePackage{ragged2e}

% -----------------------------------------------------------------------------
% Layout
% -----------------------------------------------------------------------------
% Exact column proportions stated by the original project's author:
% 89 mm + 5.9 mm + 89 mm = 183.9 mm on A4 (210 x 297 mm).
\geometry{a4paper,left=13.05mm,right=13.05mm,top=18mm,bottom=17mm,
          headheight=12pt,headsep=4mm,footskip=11mm}
\setlength{\columnsep}{5.9mm}
\setlength{\columnseprule}{0pt}
\setlength{\parindent}{3.6mm}
\setlength{\parskip}{0pt}
\setlength{\emergencystretch}{1.5em}
\frenchspacing
\raggedbottom

% -----------------------------------------------------------------------------
% Typography and colors
% -----------------------------------------------------------------------------
% STIX Two Text / Math are TeX Live fonts and available on Overleaf.
\setmainfont{STIXTwoText}[
  Extension=.otf,
  UprightFont=*-Regular,
  BoldFont=*-Bold,
  ItalicFont=*-Italic,
  BoldItalicFont=*-BoldItalic,
  Ligatures=TeX]
\setmathfont{STIXTwoMath-Regular.otf}
% Helvetica-style sans serif, with a portable TeX Live fallback.
% The former NimbusSans-Regular.otf reference was not available on every
% Overleaf installation, causing font failures and cascading dimension errors.
% TeX Gyre Heros is a Helvetica-compatible TeX Live font. On minimal local
% installations without its OpenType files, use Latin Modern Sans instead.
% Neither branch depends on external system-only NimbusSans font files.
\IfFileExists{texgyreheros-regular.otf}{%
  \setsansfont{texgyreheros}[
    Extension=.otf,
    UprightFont=*-regular,
    BoldFont=*-bold,
    ItalicFont=*-italic,
    BoldItalicFont=*-bolditalic,
    Scale=MatchLowercase]
  \ClassInfo{biorxiv-chrelli}{Using TeX Gyre Heros for sans-serif text}%
}{%
  \setsansfont{lmsans10}[
    Extension=.otf,
    UprightFont=*-regular,
    BoldFont=*-bold,
    ItalicFont=*-oblique,
    BoldItalicFont=*-boldoblique,
    Scale=MatchLowercase]
  \ClassWarningNoLine{biorxiv-chrelli}{TeX Gyre Heros OTF unavailable; using Latin Modern Sans instead}%
}
\definecolor{biorxivred}{HTML}{C50000}
\definecolor{biorxivblue}{HTML}{5D9DD0}
\hypersetup{colorlinks=true,linkcolor=biorxivred,citecolor=biorxivred,
            urlcolor=biorxivred,pdfcreator={XeLaTeX / Overleaf},
            pdftitle={bioRxiv preprint}}

% Compact, justified main text.
\AtBeginDocument{\fontsize{9.4pt}{10.75pt}\selectfont\justifying}
\newcommand{\MethodsText}{\fontsize{8.65pt}{9.8pt}\selectfont}

% -----------------------------------------------------------------------------
% Headings
% -----------------------------------------------------------------------------
% All section heads are unnumbered and red, as in the Word style gallery.
\setcounter{secnumdepth}{0}
\titleformat{\section}[hang]
  {\sffamily\bfseries\color{biorxivred}\fontsize{10pt}{11.5pt}\selectfont}
  {}{0pt}{}
\titlespacing*{\section}{0pt}{9pt plus 3pt minus 1pt}{1.8pt}
\titleformat{\subsection}[hang]
  {\sffamily\bfseries\color{biorxivred}\fontsize{9.1pt}{10.5pt}\selectfont}
  {}{0pt}{}
\titlespacing*{\subsection}{0pt}{6pt plus 2pt minus 1pt}{1pt}
\titleformat{\subsubsection}[runin]
  {\sffamily\bfseries\color{biorxivred}\fontsize{8.6pt}{10pt}\selectfont}
  {}{0pt}{}[.\ ]
\titlespacing*{\subsubsection}{0pt}{5pt}{3pt}

% -----------------------------------------------------------------------------
% Captions and floats
% -----------------------------------------------------------------------------
% Legend styles: red title / black text.
\DeclareCaptionFont{biorxivlegend}{\fontsize{7.8pt}{9.0pt}\selectfont}
\captionsetup[figure]{font=biorxivlegend,
    labelfont={bf,color=biorxivred},textfont=normalfont,
    labelsep=colon,justification=raggedright,singlelinecheck=false,
    skip=2.5pt}
\captionsetup[table]{font=biorxivlegend,
    labelfont={bf,color=biorxivred},textfont=normalfont,
    labelsep=colon,justification=raggedright,singlelinecheck=false,
    skip=3pt,position=top}
\newcommand{\legendtitle}[1]{{\sffamily\bfseries\color{biorxivred}#1}\enspace}
\setlength{\textfloatsep}{10pt plus 2pt minus 3pt}
\setlength{\floatsep}{8pt plus 2pt minus 2pt}
\setlength{\intextsep}{8pt plus 2pt minus 2pt}
\renewcommand{\topfraction}{0.95}
\renewcommand{\dbltopfraction}{0.95}
\renewcommand{\textfraction}{0.05}
\setcounter{topnumber}{4}
\setcounter{dbltopnumber}{3}

% -----------------------------------------------------------------------------
% Manuscript metadata
% -----------------------------------------------------------------------------
\makeatletter
\def\@biorxivtitle{Title of the manuscript}
\def\@biorxivauthors{First A. Author\textsuperscript{1}}
\def\@biorxivaffils{\textsuperscript{1}Affiliation}
\def\@biorxivabstract{Write a short abstract here.}
\def\@biorxivrunning{Running title}
\def\@biorxivfooter{Lastname et al. 2026 (preprint)}
\newcommand{\PaperTitle}[1]{\gdef\@biorxivtitle{#1}}
\newcommand{\PaperAuthors}[1]{\gdef\@biorxivauthors{#1}}
\newcommand{\PaperAffiliations}[1]{\gdef\@biorxivaffils{#1}}
\newcommand{\PaperAbstract}[1]{\gdef\@biorxivabstract{#1}}
\newcommand{\RunningTitle}[1]{\gdef\@biorxivrunning{#1}}
\newcommand{\FooterCitation}[1]{\gdef\@biorxivfooter{#1}}
\newcommand{\affilmarker}[1]{{\color{biorxivred}\textsuperscript{#1}}}

% -----------------------------------------------------------------------------
% Logo
% -----------------------------------------------------------------------------
% The wordmark PDF comes from the bundled, horizontally cropped SVG.
% Set the size by changing the value below (or with \SetBioRxivLogoWidth).
\newlength{\biorxivwordmarkwidth}
\setlength{\biorxivwordmarkwidth}{31.7mm}
\newcommand{\SetBioRxivLogoWidth}[1]{\setlength{\biorxivwordmarkwidth}{#1}}
\newcommand{\biorxivwordmark}{%
  \begingroup
  \includegraphics[width=\biorxivwordmarkwidth]{biorxiv-logo.pdf}%
  \endgroup
}
% Wordmark is opt-in per manuscript, so commenting out \ShowBioRxivLogo
% removes both the logo and its surrounding whitespace.
\newif\ifbiorxivlogovisible
\biorxivlogovisiblefalse
\newcommand{\ShowBioRxivLogo}{\biorxivlogovisibletrue}

% -----------------------------------------------------------------------------
% Title block
% -----------------------------------------------------------------------------
\newcommand{\@biorxivtitleblock}{%
  \ifbiorxivlogovisible
    % Match the visible logo's top with the title's top in logo-free mode.
    % The wordmark PDF has a small amount of padding above the ink; scale the
    % compensation with the selected logo width, so resizing keeps alignment.
    \vspace*{\dimexpr -1.75pt - 0.05218\biorxivwordmarkwidth\relax}%
    \noindent\biorxivwordmark\par
    \vspace{5.8mm}%
  \fi
  \noindent{\sffamily\bfseries\fontsize{17pt}{19pt}\selectfont
     \@biorxivtitle\par}
  \vspace{7.2mm}
  \noindent{\sffamily\bfseries\fontsize{9.6pt}{11pt}\selectfont
     \@biorxivauthors\par}
  \vspace{1.1mm}
  \noindent{\sffamily\fontsize{7.8pt}{9.0pt}\selectfont
     \@biorxivaffils\par}
  \vspace{8mm}
  \noindent{\sffamily\bfseries\fontsize{8.7pt}{10.05pt}\selectfont
     \@biorxivabstract\par}
  \vspace{5.3mm}
}
\renewcommand{\maketitle}{%
  \twocolumn[{\@biorxivtitleblock}]%
  \thispagestyle{biorxivfirst}%
}

% -----------------------------------------------------------------------------
% Headers and footers
% -----------------------------------------------------------------------------
% Running title at the top of pages 2+, compact citation and page at foot.
\fancypagestyle{biorxiv}{%
  \fancyhf{}
  \fancyhead[C]{{\sffamily\bfseries\itshape\fontsize{8pt}{8.5pt}\selectfont\@biorxivrunning}}
  \fancyfoot[L]{{\sffamily\bfseries\fontsize{7pt}{8pt}\selectfont\@biorxivfooter}}
  \fancyfoot[R]{{\sffamily\bfseries\fontsize{7pt}{8pt}\selectfont\thepage}}
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}
\fancypagestyle{biorxivfirst}{%
  \fancyhf{}
  \fancyfoot[L]{{\sffamily\bfseries\fontsize{7pt}{8pt}\selectfont\@biorxivfooter}}
  \fancyfoot[R]{{\sffamily\bfseries\fontsize{7pt}{8pt}\selectfont\thepage}}
  \renewcommand{\headrulewidth}{0pt}%
  \renewcommand{\footrulewidth}{0pt}%
}
\pagestyle{biorxiv}
\makeatother

% -----------------------------------------------------------------------------
% Citations and bibliography
% -----------------------------------------------------------------------------
% Default citation mode: inline numeric references in square brackets, e.g.
% [1,2]. These commands change in-text citations only; select the matching
% BibTeX style in the manuscript as documented in README.md.
\newcommand{\UseAPAReferences}{%
  \setcitestyle{authoryear,round,citesep={;},aysep={,},yysep={,}}%
}
\newcommand{\UseNatureReferences}{%
  \setcitestyle{super,sort&compress,open={},close={}}%
}

% Narrow references, with numbered hanging labels.
\renewcommand{\bibfont}{\fontsize{7.9pt}{9.1pt}\selectfont}
\setlength{\bibsep}{1pt plus .5pt}
\setlength{\bibhang}{1.2em}
\renewcommand{\refname}{References}
\setlist[itemize]{leftmargin=*,topsep=3pt,itemsep=1pt}
\endinput
