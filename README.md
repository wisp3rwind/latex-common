% This file should only contain things that can go into any kind of document.

% TODO: keyvals: draft (obvious), debug (load blind text packages), strict (whether to fail or fallback, e.g. for luatex-only features like specific fonts)
% TODO: math: automatically replace i/j i/jmath (have an option to prevent that)
% TODO: support passing style options to most of the commands, 
%       e.g. \vc[vecdisplay=bm]{x}
% TODO: 'features' that bundle packages + additional commands/configuration
% -> fonts are nothing but features!
% TODO: append code to package setup (independent of enabling)
% TODO: engine-specific features, engine={luatex,xetex}
% TODO: for unknown features, just assume that they are a package and automically define
% them instead of failing with an unintlligible error

% New packages to investigate
% subfigure
% geometry
% pdfpages
% cite  % better support for numeric citations
% longtable  % wrap tables at page boundaries, succeeds supertabular
% supertabular  % wrap tables at page boundaries
% wrapfig
% footmisc
% epstopdf
% textcomp
% marginnote


%\mhchemoptions{textfontcommand=\liningnumtext}
%\IfPresentationT{\renewcommand*{\bibfont}{\scriptsize}}

% TODO: remember to set locale correctly!!
%\sisetup{%
%  separate-uncertainty=true,
%  %locale = DE,
%  %per-mode = symbol
%}



