% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rt.R
\name{rt_GET}
\alias{rt_GET}
\title{Get an RT response}
\usage{
rt_GET(url, raw = FALSE, ...)
}
\arguments{
\item{url}{(character) The full RT URL}

\item{raw}{(logical) Whether or not to return the raw response from \
code{\link[httr]{GET}} (\code{TRUE}) or not (\code{FALSE})}

\item{...}{Other arguments passed to \code{\link[httr]{GET}}}
}
\value{
(rt_api) The parsed response from RT
}
\description{
Get an RT response and format it into an S3 object
}
