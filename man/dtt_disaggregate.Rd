% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/disaggregate.R
\name{dtt_disaggregate}
\alias{dtt_disaggregate}
\title{Disaggregate}
\usage{
dtt_disaggregate(x, ...)
}
\arguments{
\item{x}{A Date or POSIXct vector.}

\item{...}{Unused.}
}
\value{
The disaggregated Date or POSIXct vector.
}
\description{
Breaks a floored, unique, ordered, complete Date or POSIXct vector
into its subunits.
}
\examples{
dtt_disaggregate(as.Date("2002-01-01"))
}
