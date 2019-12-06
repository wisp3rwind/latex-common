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

\makeatletter

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

\makeatother


% Use the sans font for upright text (e.g. subscripts) in math. The default
% mathrm defaults to the roman font (surprise!) which is CM which is rather
% ugly in combination with Fira.
% FIXME: The real solution here is not to use \mathrm, but the more semantic
% \mathup
\cs_new:Npn \mathup #1
  {
    \textup{#1}
  }
\cs_gset_eq:NN \mathrm \mathup

\cs_new:Npn \__wisper_sub_upright:w |#1|
  {
    \sb { \mathup { #1 } }
  }
\cs_new_protected_nopar:Npn \__wisper_sub:w
  {
    \peek_charcode:NTF |
      { \__wisper_sub_upright:w }
      { \sb }
  }
\char_set_active_eq:nN {`\_} \__wisper_sub:w
\AtBeginDocument
  {
    \char_set_catcode_other:n {`\_}
    \char_set_mathcode:nn {`\_} {32768}
  }


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

\makeatletter

\let\@mpfootnotetext=\beamer@framefootnotetext
%\def\thefootnote{\@arabic\c@footnote}
%\def\thempfootnote{{\itshape\@alph\c@mpfootnote}}
\def\thempfootnote{\@arabic\c@mpfootnote}

%\renewcommand<>\beamer@framefootnotetext[1][\@empty]{%
%  \global\setbox\beamer@footins\vbox{%
%    \hsize\framewidth
%    \textwidth\hsize
%    \columnwidth\hsize
%    \unvbox\beamer@footins
%    \reset@font\footnotesize
%    \@parboxrestore
%    \ifx\@empty#1
%      \protected@edef\@currentlabel
%           {\csname p@footnote\endcsname\@thefnmark}%
%    \else
%      \protected@edef\@currentlabel
%           {\csname p@footnote\endcsname#1}%
%    \fi
%    \color@begingroup
%      \uncover#3{\@makefntext{%
%        \rule\z@\footnotesep\ignorespaces#2\@finalstrut\strutbox}}%
%    \color@endgroup}}

\makeatother

%\setbeamertemplate{navigation symbols}{}
%\setbeamertemplate{caption}[numbered]
\setbeamertemplate{footline}[frame number]
%\usetheme{hsrm}

% vim: ft=tex ts=2 sw=2 et fdm=marker fmr=[[[,]]]:
