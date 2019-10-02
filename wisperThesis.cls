\RequirePackage{expl3}
\ProvidesExplClass{wisperThesis} {2019-10-02} {0.1} {}

\LoadClass[ english, a4paper, DIV=calc, BCOR=0mm, fontsize=10pt, pagesize, fleqn ]{scrbook}

% Packages that need to be loaded early
\RequirePackage{wisperDefaultPackagesEarly}
\RequirePackage{standalone}
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
    citestyle=wisperNumericComp,
    bibstyle=numeric,
    autocite=superscript,
    hyperref=true,
    url=false,
    isbn=false,  %  DOI only, FIXME: show ISBN if no DOI present
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
		}
	}

\RequirePackage{caption}
\captionsetup{
	format=plain,
	%font=small,
	font={sf,footnotesize},
	labelfont=sc,
	calcwidth=0.9\linewidth,
	justification=RaggedRight
}

%\numberwithin{equation}{section}
\numberwithin{equation}{chapter}

\RequirePackage{paul-tol-colors}
\RequirePackage{wisperBoxes}

\usepackage{wispermath}
\usepackage{wisperphys}
\usepackage{wispercode}
%\usepackage{wisperplots}

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
\RequirePackage{wisperDraftTools}

% vim: ft=tex ts=2 sw=2 et fdm=marker fmr=[[[,]]]: