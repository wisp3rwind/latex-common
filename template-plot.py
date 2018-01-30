#! /usr/bin/env python3

import sys

import numpy as np
import scipy as sc
import pandas as pd
import matplotlib as mp
import matplotlib.texmanager

# ...
# Matplotlib is hardcoded to use pdflatex, which will very quickly run into the
# too many math fonts problem if loading additional fonts. Using lualatex could
# fix this, or not preloading fonts that are not going to be used. Both are not
# possible using the mpl API. Instead patch the TexManager...
class TexManager(mp.texmanager.TexManager):
    @property
    def _font_preamble(self):
        return ''

    @_font_preamble.setter
    def _font_preamble(self, value):
        pass
matplotlib.texmanager.TexManager = TexManager

import matplotlib.style
mp.use('Agg')
mp.style.use('mpl.style')
import matplotlib.pyplot as plt
from matplotlib.backends.backend_pdf import PdfPages
import seaborn as sns

from latex_tools.artistparsers import *
from latex_tools.pypgfplotting import *


if __name__ == '__main__':
    try:
        filename, width, preamble = sys.argv[1:]
        # print(filename, type(filename))
        # print(width, type(width))
        # print(preamble, type(preamble))
        width = float(width.rstrip('pt')) / 72.27  # pt -> inch, TODO: do this in tex, not here
        with open("common.tex", "r") as p, open("common_math.tex", "r") as pm, open("common_phys.tex", "r") as pp:
            preamble = [
                r"\usepackage{filecontents}",
                r"\begin{filecontents}{common.tex}",
                p.read(),
                r"\end{filecontents}",
                r"\begin{filecontents}{common_math.tex}",
                pm.read(),
                r"\end{filecontents}",
                r"\begin{filecontents}{common_phys.tex}",
                pp.read(),
                r"\end{filecontents}",
                r"\input{common.tex}",
                r"\Preamble{paper, font-only}"
                ]
            mp.rcParams['text.latex.preamble'] = ['\n'.join(preamble)]
    except ValueError:
        raise SystemExit("Invalid commandline options!")

    with PdfPages(filename + ".pdf") as pdf:
        aspect = 5. / 10.
        fig = plt.figure(figsize=(width, width * aspect))
        ax = fig.add_subplot(1, 1, 1)

        x = np.linspace(0, 2*np.pi, 1000)
        ax.plot(x, np.sin(x),
                label=rf"$\alpha = 1$"
                )
        ax.set_xlabel(r"$x$")
        ax.set_ylabel(r"$\sin(x)$")
        ax.grid()
        ax.legend(loc='best')

        fig.tight_layout()
        pdf.savefig()
