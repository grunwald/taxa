% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/taxmap--docs.R
\name{get_data}
\alias{get_data}
\title{Get data in a taxmap object by name}
\arguments{
\item{obj}{A \code{\link[=taxmap]{taxmap()}}  object}

\item{name}{(\code{character}) Names of data to return.}

\item{...}{Passed to \code{\link[=all_names]{all_names()}}. Used to filter what kind of data is
returned (e.g. columns in tables or function output?) if \code{name} is not
supplied or what kinds are allowed if \code{name} is supplied.}
}
\value{
\code{list}
}
\description{
Given a vector of names, return a list of data contained in a \code{\link[=taxmap]{taxmap()}}
object. \preformatted{
obj$get_data(name)
get_data(obj, name)}
}
\examples{
ex_taxmap$get_data("reaction")

}
\seealso{
Other accessors: \code{\link{all_names}},
  \code{\link{data_used}}, \code{\link{names_used}}
}
