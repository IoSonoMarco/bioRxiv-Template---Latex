# bioRxiv-inspired LaTeX template

An **Overleaf-ready, two-column LaTeX manuscript template** inspired by the typography of the [bioRxiv Word template by Chrelli](https://github.com/chrelli/bioRxiv-word-template).

> **Unofficial template:** this is an independent LaTeX adaptation, not an official bioRxiv document class or a guarantee of compliance with any journal's submission requirements.

## Preview

<p align="center">
  <a href="preview/main.pdf">
    <img src="preview/cover.png" alt="Three-page preview of the bioRxiv-inspired LaTeX manuscript template" width="100%">
  </a>
</p>

<p align="center">
  <a href="preview/main.pdf"><strong>View full sample PDF</strong></a>
  &nbsp;·&nbsp;
  <a href="https://github.com/IoSonoMarco/bioRxiv-Template---Latex/archive/refs/heads/main.zip"><strong>Download template ZIP</strong></a>
</p>

## Quick start

1. [Download the repository as a ZIP](https://github.com/IoSonoMarco/bioRxiv-Template---Latex/archive/refs/heads/main.zip).
2. In **Overleaf**, create a project by uploading the ZIP.
3. In the project settings, select **XeLaTeX** as the compiler.
4. Compile **`main.tex`**, then replace the sample metadata, text, figures, and references with your own content.

**Important:** Keep `biorxiv-chrelli.cls` and `biorxiv-logo.pdf` alongside `main.tex`. The template requires XeLaTeX or LuaLaTeX; pdfLaTeX is not supported.

## Features

- Overleaf-ready manuscript structure with a compact two-column A4 layout.
- bioRxiv-inspired STIX typography, red headings, and figure-caption styling.
- Standard LaTeX sections, subsections, and run-in subsubsections.
- Simple commands for manuscript metadata and correspondence details.
- Optional bioRxiv wordmark with an adjustable width.
- Numeric, APA-like author–year, and Nature-like superscript citations through `natbib`.
- One-column (89 mm), 1.5-column (133.125 mm), and full-width (183.9 mm) figures.
- Template-specific smaller typography for Materials and Methods.

## Template-specific commands

| Category | Command | Description |
|:--|:--|:--|
| Logo | `\ShowBioRxivLogo` | Shows the bioRxiv wordmark above the title. |
| Logo | `\SetBioRxivLogoWidth{...}` | Changes the wordmark width from its 31.7 mm default. |
| Metadata | `\PaperTitle{...}` | Sets the manuscript title. |
| Metadata | `\PaperAuthors{...}` | Sets the author list. |
| Metadata | `\PaperAffiliations{...}` | Sets affiliations and correspondence details. |
| Metadata | `\affilmarker{...}` | Inserts a styled affiliation or correspondence marker. |
| Metadata | `\PaperAbstract{...}` | Sets the abstract in the title block. |
| Metadata | `\RunningTitle{...}` | Sets the running header from page 2 onward. |
| Metadata | `\FooterCitation{...}` | Sets the citation text in the page footer. |
| Citations | `\UseAPAReferences` | Selects APA-like author–year citations. |
| Citations | `\UseNatureReferences` | Selects Nature-like superscript citations. |
| Figures | `\legendtitle{...}` | Styles the opening title of a figure or table caption. |
| Typography | `\MethodsText` | Applies the template's smaller methods typography. |

Everything else uses standard LaTeX commands and environments. Use `\section`, `\subsection`, and `\subsubsection` for manuscript headings; standard `figure`, `table`, and equation environments for scientific content; and `\caption`, `\label`, and `\ref` for captions and cross-references. Citation commands such as `\citep` and `\citet` come from the included `natbib` package, and bibliographies use the standard BibTeX workflow. The class applies the appropriate typography and layout automatically.

### Minimal manuscript structure

```latex
\documentclass{biorxiv-chrelli}

\ShowBioRxivLogo  % Optional; comment out to hide the logo

\PaperTitle{Your manuscript title}
\PaperAuthors{Jane Doe\affilmarker{1}, John Smith\affilmarker{2}}
\PaperAffiliations{%
  \affilmarker{1}First institution\\
  \affilmarker{2}Second institution
}
\PaperAbstract{A concise summary of your research.}
\RunningTitle{Short manuscript title}
\FooterCitation{Doe et al. (preprint)}

\begin{document}
\maketitle

\section{Introduction}
Your introduction goes here.

\section{Results}
\subsection{A finding}
Your results go here.

\section{Materials and Methods}
{\MethodsText
\subsection{Experimental procedure}
Describe your methods here.
}

\section{Discussion}
Your discussion goes here.

\bibliographystyle{unsrtnat}
\bibliography{references}
\end{document}
```

## Customize the logo

The class **hides the wordmark by default**. The provided `main.tex` shows it by explicitly calling `\ShowBioRxivLogo` after `\documentclass`.

```latex
\ShowBioRxivLogo              % Show the logo
\SetBioRxivLogoWidth{31.7mm}  % Optional width adjustment
```

To hide the logo and remove its reserved spacing, omit or comment out `\ShowBioRxivLogo`.

`biorxiv-logo.pdf` is the vector asset LaTeX uses; `biorxiv-logo.svg` is the editable vector source. The wordmark is horizontally cropped to align with the manuscript text.

## Citations and bibliography

The class already loads **`natbib`**, so do not load it again. Choose **one** citation mode in the preamble, and match the bibliography style at the end of your document:

| Citation mode | Preamble | Bibliography style | In-text appearance |
|:--|:--|:--|:--|
| **Numeric (default)** | No extra command | `\bibliographystyle{unsrtnat}` | `[1,2]` |
| **APA-like author–year** | `\UseAPAReferences` | `\bibliographystyle{apalike}` | `(Smith et al., 2026)` |
| **Nature-like superscripts** | `\UseNatureReferences` | `\bibliographystyle{unsrtnat}` | Superscript `1,2`, without brackets |

For numeric citations, `plainnat` is another option if you prefer alphabetically sorted bibliography entries. `apalike` is **not strict APA 7**, and the Nature-like option is **not a certified Nature bibliography style**.

Write citations using `\citep{key}` or `\citet{key}`, then include:

```latex
\bibliography{references}
```

When switching between numeric and author–year styles in Overleaf, **recompile from scratch** so BibTeX regenerates its cached files. Do not activate `\UseAPAReferences` and `\UseNatureReferences` together.

## Figures

The included sample illustrates three useful figure widths:

| Figure | Width | Recommended environment |
|:--|--:|:--|
| One column | 89 mm | `figure` |
| One-and-a-half columns | 133.125 mm | `figure*` with a `minipage` of that width |
| Full width | 183.9 mm | `figure*` |

For example, a one-column figure can be written as:

```latex
\begin{figure}[t]
  \centering
  \includegraphics[width=\columnwidth]{myfigure}
  \caption{\legendtitle{Main finding.} Explain the figure here.}
  \label{fig:example}
\end{figure}
```

Figures using `figure*` are double-column floats and may appear at the top of a following page rather than at their exact position in the source. Refer to `main.tex` for working examples of all three widths.

## Methods typography

Use `\MethodsText` inside a group so the smaller methods typography does not affect later sections. Standard headings continue to receive their class-defined styles inside the group.

```latex
\section{Materials and Methods}
{\MethodsText
\subsection{Experimental procedure}
Describe the procedure here.
}
```

## Project files

| File | Purpose |
|:--|:--|
| `main.tex` | Editable example manuscript. |
| `biorxiv-chrelli.cls` | Layout, typography, and custom commands. |
| `references.bib` | Example bibliography database. |
| `biorxiv-logo.pdf` / `biorxiv-logo.svg` | Vector logo asset and editable source. |
| `preview/cover.png` | Three-page horizontal preview shown above. |
| `preview/main.pdf` | Compiled example manuscript. |

## License and attribution

See [LICENSE](LICENSE) for the repository license (GPL-3.0). Inspired by the [Chrelli bioRxiv Word template](https://github.com/chrelli/bioRxiv-word-template); this repository is independently maintained and is not affiliated with or endorsed by bioRxiv.
