% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/create_figures_doc.R
\name{create_figures_doc}
\alias{create_figures_doc}
\title{Create Quarto Document of Figures}
\usage{
create_figures_doc(
  resdir = NULL,
  model_results = NULL,
  model = c("SS3", "BAM", "ASAP", "AMAK", "WHAM"),
  year = NULL,
  subdir = NULL,
  include_all = TRUE
)
}
\arguments{
\item{resdir}{directory where the results file is located}

\item{model_results}{name of the results file of assessment output}

\item{model}{stock assessment model}

\item{year}{end year for assessment to include in plotting}

\item{subdir}{subdirectory where the assessment report template is being stored}

\item{include_all}{include all default figures for a stock assessment report}
}
\value{
Create a quarto document as part of a stock assessment outline with
pre-loaded R chunk adding the stock assessment tables from the nmfs-ost/satf R package
}
\description{
Create Quarto Document of Figures
}
