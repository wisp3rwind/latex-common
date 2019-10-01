# Add latex-common to search path
$ENV{TEXINPUTS} = './latex-common//:';
# directly output pdf
$pdf_mode = 1;
@default_files = ('main.tex');
$latex = 'latex -interaction=nonstopmode -shell-escape';
$pdflatex = 'pdflatex -interaction=nonstopmode -shell-escape';


# vim: set ft=perl :
