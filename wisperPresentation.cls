\RequirePackage{expl3}
\RequirePackage{xparse}
\ProvidesExplClass{wisperPresentation} {2019-11-27} {0.1} {}

\LoadClass[ english, smaller ]{beamer}

%\RequirePackage{wisperKOMAMisc}
%\RequirePackage{wisperFontsFira}
\RequirePackage[doi=false, arxiv=false, giveninits=true, date=year]{biblatex}
%\RequirePackage{wisperBiblatexAlphabetic}
\RequirePackage{caption}
\RequirePackage{pgfpages}  % for notes on second screen
\RequirePackage{setspace}  % control line stretch
\PassOptionsToPackage {main=english} {babel} 
\RequirePackage{appendixnumberbeamer}

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

\setbeamertemplate{itemize ~ items}{ \faAngleRight }

\AtBeginDocument
  {
    \ltx@ifpackageloaded {enumitem}
      {
        \setlist[itemize,1]
          { label=\protect\usebeamertemplate*{itemize ~ item} }
        \setlist[itemize,2]
          { label=\protect\usebeamertemplate*{itemize ~ subitem} }
        \setlist[itemize,3]
          { label=\protect\usebeamertemplate*{itemize ~ subsubitem} }
      }
      { }
  }

\AtBeginDocument
  {
    \ltx@ifpackageloaded {siunitx}
      {
        \sisetup{
          mode = text,
          detect-all,
          detect-inline-family = text,
          detect-inline-weight = text,
        }
      }
      { }
  }


% Minimize biblatex bibliography to fit fullcite into footnotes [[[1

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

% Do not print title to save space
\DeclareFieldFormat[article]{title}{}

% https://tex.stackexchange.com/questions/46787/is-there-a-way-to-prevent-urls-from-appearing-in-biblatex-citations
\renewbibmacro*{in:}{} 
\AtEveryCitekey{%
  \clearfield{url}%
  \clearfield{urlyear}
  \clearfield{doi}%
  \clearfield{arxivId}%
  \clearfield{eprint}%
  \clearfield{issn}%
  \clearfield{isbn}%
 }
\AtEveryBibitem{%
  \clearfield{url}%
  \clearfield{urlyear}
  \clearfield{doi}%
  \clearfield{arxivId}%
  \clearfield{eprint}%
  \clearfield{issn}%
  \clearfield{isbn}%
 }


% Optimize footnote layout [[[1

% Footnotemarks in square brackets for use with citations
% https://tex.stackexchange.com/questions/368757/add-square-brackets-to-footfullcite-in-beamer, but
% fixed to be less intrusive
\def \@makefnmark
	{
		\hbox
			{
				\bgroup
					\usebeamercolor[fg]{footnote mark}
					\usebeamerfont*{footnote mark}
					[
					\@thefnmark
					]
				\egroup
				\,
			}
	}

% Reduce footnote spacing
\AtBeginDocument
	{%
		\bgroup%
			\footnotesize%
      % Global setlength, cf. https://tex.stackexchange.com/a/406025/111880
      % Since we need to select \footnotesize first, the group is necessary,
      % hence, this cannot be done with a local \setlength
      \setlength\skip@{.5\baselineskip}%
			\global\footnotesep=\skip@%
    \egroup%
	}

% Reduce footnote linespacing (\setstretch)
% This is copied from beamerinnerthememetropolis.sty (and also made less intrusive) 
\setbeamertemplate{footnote}{
	\parindent 0em\noindent
	\raggedright\setstretch{1.0}
	\hbox to 1.8em{\hfil\insertfootnotemark}\insertfootnotetext\par
}

\let\@mpfootnotetext=\beamer@framefootnotetext
%\def\thefootnote{\@arabic\c@footnote}
%\def\thempfootnote{{\itshape\@alph\c@mpfootnote}}
\def\thempfootnote{\@arabic\c@mpfootnote}

%\setbeamertemplate{navigation symbols}{}
%\setbeamertemplate{caption}[numbered]
\setbeamertemplate{footline}[frame number]

% vim: ft=tex ts=2 sw=2 et fdm=marker fmr=[[[,]]]:
