[![XeLaTeX](https://github.com/xiahualiu/my-resume/actions/workflows/build.yaml/badge.svg?branch=main)](https://github.com/xiahualiu/my-resume/actions/workflows/build.yaml)

# Xiahua Liu — Resume

One two-page resume covering software, Linux, controls, and robotics experience.

- [Resume PDF](resume.pdf)
- [Plain text](resume.txt)
- [LaTeX source](resume.tex)

All content and formatting live in `resume.tex`. The resume uses a single-column layout with Source Sans 3 at 11 points. Headings and job titles use Bold, main bullets and skill labels use Semibold, and supporting text uses Regular. Public contact links are included; add private contact information in `resume.tex` before submitting if needed.

## Fonts

Keep `fonts/` in the repository. XeLaTeX loads the OTF files directly, so builds work without installing fonts on the system. The folder contains the Regular, Semibold, Bold, Italic, and Bold Italic files referenced by the font configuration, along with their [SIL Open Font License](fonts/OFL.txt).

Fonts are embedded in the finished PDF; recipients only need `resume.pdf`.

## Build

Install TeX Live with XeLaTeX, `fontspec`, `geometry`, `microtype`, `enumitem`, `titlesec`, and `hyperref`. On Debian/Ubuntu:

```bash
sudo apt install texlive-xetex texlive-latex-extra texlive-fonts-recommended
```

From the repository root, run XeLaTeX twice to produce `resume.pdf` and resolve PDF links:

```bash
xelatex -halt-on-error resume.tex
xelatex -halt-on-error resume.tex
```

The auxiliary files `resume.aux`, `resume.log`, and `resume.out` are ignored by Git and can be deleted after building.

To refresh the optional plain-text copy, install Poppler (`sudo apt install poppler-utils` on Debian/Ubuntu), then run:

```bash
pdftotext -enc UTF-8 -nopgbrk resume.pdf resume.txt
```

The GitHub workflow builds `resume.tex` with XeLaTeX and uploads `resume.pdf` as the `PDF` artifact on the [Actions page](https://github.com/xiahualiu/my-resume/actions).
