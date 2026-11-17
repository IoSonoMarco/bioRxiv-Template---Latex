# bioRxiv-inspired Overleaf template

An independent LaTeX adaptation; not an official bioRxiv document class.

## Compile

Upload this ZIP as a project in Overleaf, set compiler to **XeLaTeX**, then compile `main.tex`.

## Header wordmark

The project includes `biorxiv-logo.svg` (editable vector source) and `biorxiv-logo.pdf` (vector PDF used directly by LaTeX). The SVG was **cropped horizontally to the letterforms**, removing the blank left/right margins so the visible `bioRxiv` wordmark aligns with the left edge of the title, affiliations, and body text. The original glyph size has been preserved. No subtitle is shown.

### bioRxiv wordmark toggle

In the .tex file, right after \documentclass{biorxiv-chrelli}:

  \ShowBioRxivLogo % default example: visible

Comment out that line to hide the logo and its vertical spacing:

  % \ShowBioRxivLogo

The class itself defaults to no logo, so other .tex files using this class
show a logo only if they explicitly call \ShowBioRxivLogo.
An optional \HideBioRxivLogo command is also available.

## Citation and bibliography styles

The class uses **`natbib`**, allowing you to keep `\citep{key}` and
`\citet{key}` in the manuscript. Citation *appearance* is selected near the
start of your `.tex` file, immediately after `\documentclass`, while the
**BibTeX reference-list layout** is selected with `\bibliographystyle` at the
end of the manuscript. Choose **one** citation mode at a time.

### Default: inline numeric citations `[1,2]`

No extra command is required:

```latex
\documentclass{biorxiv-chrelli}
% No citation-style command: [1,2] in the text
```

Use a **numeric** BibTeX style at the end of the manuscript:

```latex
\bibliographystyle{unsrtnat} % numbered, order of first citation
\bibliography{references}
```

Here, `\citep{smith2003,jones2005}` prints bracketed inline numbers such as
`[1,2]` (possibly compressed as `[1–3]` for consecutive citations).
You may use `plainnat` in place of `unsrtnat` if you prefer the bibliography
sorted alphabetically rather than by citation order.

### APA-like: author–year citations

Activate this command right after `\documentclass`:

```latex
\documentclass{biorxiv-chrelli}
\UseAPAReferences
```

At the end of the manuscript, switch the **bibliography style as well**:

```latex
\bibliographystyle{apalike}
\bibliography{references}
```

Examples: `\citep{smith2003}` gives `(Smith et al., 2003)` and
`\citet{smith2003}` gives `Smith et al. (2003)`, subject to the author list
in the `.bib` entry. `apalike` is **APA-like**, not a strict APA 7 style.

### Nature-like: superscript reference numbers without brackets

Activate this command right after `\documentclass`:

```latex
\documentclass{biorxiv-chrelli}
\UseNatureReferences
```

At the end of the manuscript, use a **numeric** bibliography style:

```latex
\bibliographystyle{unsrtnat}
\bibliography{references}
```

Example: `text\citep{smith2003,jones2005}` prints a superscript numeric
citation after “text”, such as `text¹,²`, **without square brackets or
parentheses**; consecutive references are compressed into ranges.
The **reference list itself** remains numbered using `unsrtnat`; this is
Nature-*like* citation formatting, not a journal-certified Nature `.bst`.

### Switching modes

- **No style command:** default inline `[1,2]`, with `unsrtnat` or `plainnat`.
- **`\UseAPAReferences`:** author–year citations, with `apalike`.
- **`\UseNatureReferences`:** unbracketed superscript numbers, with `unsrtnat`.

To switch back to the default, comment out the optional `\Use...References`
command, and restore a numeric `\bibliographystyle`. When changing between
numeric and author–year formats, **recompile from scratch** in Overleaf so
BibTeX regenerates the `.bbl` file and citation metadata. Do not use both
`\UseAPAReferences` and `\UseNatureReferences` together. Do not additionally
load `natbib`, `amsfonts`, or `amssymb` in your `.tex` file: the class already
provides the necessary math and citation support.

## Figures

The 3-page sample manuscript demonstrates 89 mm single-column, 133.125 mm one-and-a-half-column, and 183.9 mm full-width figure environments.
