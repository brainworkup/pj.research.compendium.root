% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/make_data_frames.R
\name{compute_pctile_range}
\alias{compute_pctile_range}
\title{FUNCTION_TITLE}
\usage{
compute_pctile_range(
  .x,
  .score = NA,
  .score_type = c("z_score", "scaled_score", "t_score", "standard_score", "raw_score"),
  percentile = NA,
  range = NA,
  pct1 = NA,
  pct2 = NA,
  pct3 = NA,
  z = NA,
  ...
)
}
\arguments{
\item{.x}{PARAM_DESCRIPTION}

\item{.score}{PARAM_DESCRIPTION, Default: NA}

\item{.score_type}{PARAM_DESCRIPTION, Default: c("z_score", "scaled_score", "t_score", "standard_score", "raw_score")}

\item{percentile}{PARAM_DESCRIPTION, Default: NA}

\item{range}{PARAM_DESCRIPTION, Default: NA}

\item{pct1}{PARAM_DESCRIPTION, Default: NA}

\item{pct2}{PARAM_DESCRIPTION, Default: NA}

\item{pct3}{PARAM_DESCRIPTION, Default: NA}

\item{z}{PARAM_DESCRIPTION, Default: NA}

\item{...}{PARAM_DESCRIPTION}
}
\value{
OUTPUT_DESCRIPTION
}
\description{
FUNCTION_DESCRIPTION
}
\details{
DETAILS
}
\examples{
\dontrun{
if(interactive()){
 #EXAMPLE1
 }
}
}
\seealso{
\code{\link[tidytable]{mutate}}, \code{\link[tidytable]{case_when}}, \code{\link[tidytable]{select}}
\code{\link[stats]{Normal}}, \code{\link[stats]{sd}}
}
