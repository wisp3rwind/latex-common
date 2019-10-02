\documentclass[ english, a4paper, DIV=calc, BCOR=0mm, fontsize=10pt, pagesize, fleqn ]{scrbook}

\usepackage{wisperFontSetupTexGyreAndFira}
\usepackage{wisperKOMAMisc}
\KOMAoptions{DIV=last}
\usepackage{wisperFootnotecite}
\usepackage[giveninits=true, date=year]{biblatex}
\usepackage{wisperNumericSupercite}
\usepackage{caption}

\AtBeginDocument{
	\AtEveryBibitem
		{
			\clearlist{location}
			\clearfield{note}
			\clearfield{pagetotal}
		}
	}
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
\KOMAoption{toc}{bibliography}%, flat}
\KOMAoptions{overfullrule=true}
\setcounter{tocdepth}{\sectiontocdepth}
\DeclareTOCStyleEntries[
		linefill={\ {\color{mark-pale-grey}\footnotesize\textbullet}\ },
		raggedpagenumber=true,
		raggedentrytext=true,
		pagenumberbox=\mbox
	]{tocline}{chapter,section}
\PassOptionsToPackage {main=english} {babel} 


% vim: ft=tex ts=2 sw=2 et fdm=marker fmr=[[[,]]]:
