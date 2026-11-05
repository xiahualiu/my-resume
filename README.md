[![XeLaTeX](https://github.com/xiahualiu/my-resume/actions/workflows/build.yaml/badge.svg?branch=main)](https://github.com/xiahualiu/my-resume/actions/workflows/build.yaml)

# Xiahua Liu — Resume

One two-page resume covering software, Linux, controls, and robotics experience.

- [Resume PDF](resume.pdf)
- [Plain text](resume.txt)
- [LaTeX content](resume.tex)
- [Formatting, contact information, and education](resume-common.tex)

The resume uses a single-column layout with Source Sans 3 at 11 points. Headings and job titles use Bold, main bullets and skill labels use Semibold, and supporting text uses Regular. Public contact links are included; add private contact information in `resume-common.tex` before submitting if needed.

## Fonts

Keep `fonts/` in the repository. XeLaTeX loads the OTF files directly, so builds work without installing fonts on the system. The folder contains the Regular, Semibold, Bold, Italic, and Bold Italic files referenced by the font configuration, along with their [SIL Open Font License](fonts/OFL.txt).

Fonts are embedded in the finished PDF; recipients only need `resume.pdf`.

## Build

Install TeX Live with XeLaTeX, `fontspec`, `geometry`, `microtype`, `enumitem`, `titlesec`, and `hyperref`, plus GNU Make. For plain-text export, install Poppler (`poppler-utils` on Debian/Ubuntu).

```bash
make
make text
```

The finished files are `resume.pdf` and `resume.txt`. Intermediate files stay in `build/`.

- `make -B text` rebuilds the PDF and plain text from scratch.
- `make clean` removes intermediate files while keeping the finished resume.
- `pdftotext resume.pdf -` displays the PDF's reading order.

The GitHub workflow builds `resume.tex` with XeLaTeX and uploads `resume.pdf` as the `PDF` artifact on the [Actions page](https://github.com/xiahualiu/my-resume/actions).
