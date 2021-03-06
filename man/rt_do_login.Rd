% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/rt_login.R
\name{rt_do_login}
\alias{rt_do_login}
\title{Actually do the logging in part of logging in}
\usage{
rt_do_login(user, password, ...)
}
\arguments{
\item{user}{(character) Your username.}

\item{password}{(character) Your password.}

\item{...}{Other arguments passed to \code{\link{rt_POST}}}
}
\value{
(logical) Either returns \code{TRUE} if successful or errors out
}
\description{
Called by \code{\link{rt_login}} and \code{\link{rt_login_interactive}} to
do the work of logging in
}
