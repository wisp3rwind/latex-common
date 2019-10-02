\documentclass[ english, smaller ]{beamer}

\usepackage{wisperKOMAMisc}
\usepackage{wisperFontsFira}
\usepackage[doi=false, arxiv=false, giveninits=true, date=year]{biblatex}
\usepackage{wisperBiblatexAlphabetic}
\usepackage{caption}
\usepackage{pgfpages}  % for notes on second screen
\usepackage{setspace}  % control line stretch
\PassOptionsToPackage {main=english} {babel} 

% TODO: devise a way to properly cite image references, cf.
% the cite:online hack.
% TODO: move the slide environments here
\let\footnotesize\tiny
\let\beamerfootnote\footnote
\RenewDocumentCommand \footnote { m }
	{ \beamerfootnote[frame]{#1} }
%\NewDocumentCommand \footnotetextCite { m }
%  { \footnotetext[frame]{#1} }
\usetheme{metropolis}
\metroset
	{
		sectionpage=none,
		numbering=fraction,
		progressbar=frametitle,  % head, foot, frametitle, none
		block=fill,  % transparent, fill {for theorem and example environments}
	}
%\setbeamertemplate{footline}[page number]{}
\setbeamertemplate{footline}[frame number]{}
\setbeamerfont{caption}{size=\footnotesize}
% compat with enumitem package
% TODO: make this conditional on enumitem being loaded
\setlist[itemize,1]
	{ label=\protect\usebeamertemplate*{itemize~item} }
\setlist[itemize,2]
	{ label=\protect\usebeamertemplate*{itemize~subitem} }
\setlist[itemize,3]
	{ label=\protect\usebeamertemplate*{itemize~subsubitem} }
% https://tex.stackexchange.com/questions/31616/how-to-use-shortjournal-with-biblatex-and-biblatex-chem
\renewbibmacro*{journal}{%
	\iffieldundef{shortjournal}
		{%
			\iffieldundef{journaltitle}
				{}
				{%
					\printtext[journaltitle]
						{%
							\printfield[titlecase]{journaltitle}%
							\setunit{\subtitlepunct}%
							\printfield[titlecase]{journalsubtitle}%
						 }%
				 }%
		}
		{\printtext[journaltitle]{\printfield[titlecase]{shortjournal}}}%
}
% https://tex.stackexchange.com/questions/368757/add-square-brackets-to-footfullcite-in-beamer, but
% fixed to be less intrusive
\def \@makefnmark
	{
		\hbox
			{
				\,
				\bgroup
					\usebeamercolor[fg]{footnote mark}
					\usebeamerfont*{footnote mark}
					[
					\@thefnmark
					]
				\egroup
			}
	}
\AtBeginDocument
	{
		\bgroup
			%\showthe\baselineskip
			\footnotesize
			%\showthe\baselineskip
			% Some expandafter trickery needed because 
			% \setlength\skip@{\baselineskip}
			% for some reason ends up as
			% \setlength\skip @{\baselineskip}
			% in the preamble (note the space) which obviously fails
			\setlength { \csname skip@\endcsname } { .5\baselineskip }
			%\showthe \footnotesep
			\expandafter \global \expandafter \footnotesep
				\expandafter = \csname skip@\endcsname 
			%\showthe \footnotesep
		\egroup
	}

%\AtBeginDocument{\setstretch{1.5}}
% This is copied from beamerinnerthememetropolis.sty (and also made less intrusive) 
% with reduced linespacing (\setstretch)
\setbeamertemplate{footnote}{
	\parindent 0em\noindent
	\raggedright\setstretch{1.0}
	\hbox to 1.8em{\hfil\insertfootnotemark}\insertfootnotetext\par
}


% vim: ft=tex ts=2 sw=2 et fdm=marker fmr=[[[,]]]:
