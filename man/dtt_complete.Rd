% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/complete.R
\name{dtt_complete}
\alias{dtt_complete}
\title{Complete}
\usage{
dtt_complete(x, from = min(x), to = max(x), floor = TRUE,
  unique = TRUE, sort = TRUE, units = dtt_units(x), ...)
}
\arguments{
\item{x}{A Date or POSIXct vector.}

\item{from}{A Date or POSIXct scalar of the start date.}

\item{to}{A Date or POSIXct scalar of the to date.}

\item{floor}{A flag indicating whether to floor the values.}

\item{unique}{A flag indicating whether to return distinct values.}

\item{sort}{A flag indicating whether the returned vector must be sorted.}

\item{units}{A string of the units.}

\item{...}{Unused.}
}
\value{
The complete and possibly unique and sorted floored vector.
}
\description{
Completes a Date or POSIXct vector.
}
\examples{
dtt_completed(date_times)
}
