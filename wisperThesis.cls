\RequirePackage{expl3}
\ProvidesExplClass{wisperThesis} {2019-10-02} {0.1} {}

\LoadClass[english, a4paper, DIV=calc, BCOR=0mm, fontsize=10pt, pagesize, fleqn]{scrbook}
\PassOptionsToPackage{fleqn}{amsmath}

% Packages that need to be loaded early
\RequirePackage{wisperDefaultPackagesEarly}
%\RequirePackage{standalone}
\RequirePackage{pgfpages}
\RequirePackage[main=english]{babel}

% Setup fonts and recalculate textarea dimensions
\RequirePackage{wisperFontSetupTeXGyreAndFira}
\RequirePackage{wisperKOMAMisc}
\KOMAoptions{DIV=last}
\KOMAoption{toc}{bibliography}%, flat}
\KOMAoptions{
  overfullrule=true,
  numbers=noperiodatend,
}
\setcounter{tocdepth}{\sectiontocdepth}
\DeclareTOCStyleEntries[
		linefill={\ {\color{mark-pale-grey}\footnotesize\textbullet}\ },
		raggedpagenumber=true,
		raggedentrytext=true,
		pagenumberbox=\mbox
	]{tocline}{chapter,section}

%\usepackage{wisperFootnotecite}
\RequirePackage{titletoc}
\RequirePackage{wisperDefaultPackages}
\RequirePackage[
    %citestyle=wisperNumericComp,
    %bibstyle=numeric,
    citestyle=alphabetic,
    bibstyle=alphabetic,
    maxalphanames=1,
    autocite=superscript,
    hyperref=true,
    url=false,
    isbn=false,  %  DOI only, FIXME: show ISBN if no DOI present (maybe, for books show ISBN always?)
    maxcitenames=1,
    maxbibnames=5,
    citereset=section,
    giveninits=true, date=year
  ]{biblatex}
\AtBeginDocument{
	\AtEveryBibitem
		{
			\clearlist{location}
			\clearfield{note}
			\clearfield{pagetotal}
			\clearfield{edition}
		}
	}

% 
% https://tex.stackexchange.com/questions/68862/biblatex-alphabetic-style-like-smith-2005
\renewcommand*{\labelalphaothers}{}
\DeclareLabelalphaTemplate{
  \labelelement{
    \field[final]{shorthand}
    \field{labelname}
    \field{label}
  }
  \labelelement{
    \literal{,\addhighpenspace}
  }
  \labelelement{
    \field{year}
  }
}
\let \xcite \cite

% reduce indentation
\defbibenvironment{bibliography}
  {\list
     {\printtext[labelalphawidth]{%
        \printfield{labelprefix}%
        \printfield{labelalpha}%
        \printfield{extraalpha}}}
     {%
      \setlength{\labelwidth}{\labelalphawidth}% default
      \setlength{\labelwidth}{3em}%
      \setlength{\leftmargin}{\labelwidth}%
      \setlength{\labelsep}{\biblabelsep}%
      \addtolength{\leftmargin}{\labelsep}%
      \setlength{\itemsep}{\bibitemsep}%
      \setlength{\parsep}{\bibparsep}}%
      \renewcommand*{\makelabel}[1]{##1\hss}}
  {\endlist}
  {\item}

\RequirePackage{caption}
\captionsetup{
	format=plain,
	%font=small,
	font={sf,footnotesize},
	labelfont=sc,
	calcwidth=0.9\linewidth,
	justification=RaggedRight
}
\captionsetup[figure]{
	format=plain,
	%font=small,
	font={sf,footnotesize},
	labelfont=sc,
	calcwidth=0.9\linewidth,
	justification=RaggedRight
}
\captionsetup[table]{
	format=plain,
	%font=small,
	font={sf,footnotesize},
	labelfont=sc,
	calcwidth=0.9\linewidth,
	justification=RaggedRight
}

\RequirePackage[strict]{changepage}
\RequirePackage{wisperSidenotes}

%\numberwithin{equation}{section}
\numberwithin{equation}{chapter}

\RequirePackage{paul-tol-colors}
\RequirePackage{wisperBoxes}

\RequirePackage{wispermath}
\RequirePackage{wisperphys}
\RequirePackage{wispercode}
\RequirePackage{wisperplots}

% Packages that need to be loaded last
\RequirePackage{csquotes}  % conflicts with minted if loaded in reverse order
\RequirePackage{hyperref}
\hypersetup{
  bookmarksopen=true,
  bookmarksopenlevel=3,
  %hidelinks,  % black links
  colorlinks=true,
  %linkcolor=black,  % for internal links, color is just too much
  linkcolor=mark-dark-green,
  citecolor=mark-dark-cyan,
  filecolor=mark-dark-green,
  urlcolor=mark-dark-blue,
}
%\RequirePackage[showlabels]{wisperDraftTools}
\RequirePackage[]{wisperDraftTools}

\RequirePackage{wisperSmartFootnoteMark}


% vim: ft=tex ts=2 sw=2 et fdm=marker fmr=[[[,]]]:
