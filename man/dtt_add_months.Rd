% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/add.R
\name{dtt_add_months}
\alias{dtt_add_months}
\title{Add Months}
\usage{
dtt_add_months(x, n = 1L, ...)
}
\arguments{
\item{x}{A Date or POSIXct vector.}

\item{n}{An integer of the number of months to add}

\item{...}{Unused.}
}
\value{
The modified Date or POSIXct vector.
}
\description{
Add Months
}
\examples{
dtt_add_months(Sys.time())
}
