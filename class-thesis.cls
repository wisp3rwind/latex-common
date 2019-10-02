\documentclass[ english, a4paper, DIV=calc, BCOR=0mm, fontsize=10pt, pagesize, fleqn ]{scrbook}

\usepackage{wisperKOMAMisc}
\usepackage{wisperFontsTexGyre}
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
\numberwithin{equation}{section}
\KOMAoption{toc}{bibliography}%, flat}
\KOMAoptions{overfullrule=true}
\setcounter{tocdepth}{\sectiontocdepth}
\DeclareTOCStyleEntries[
		linefill={\ {\color{mark-pale-grey}\footnotesize\textbullet}\ },
		raggedpagenumber=true,
		raggedentrytext=true,
		pagenumberbox=\mbox
	]{tocline}{chapter,section}
