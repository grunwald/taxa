% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/hierarchy.R
\name{hierarchy}
\alias{hierarchy}
\title{Hierarchy class}
\usage{
hierarchy(...)
}
\arguments{
\item{...}{Any number of object of class \code{Taxon}}
}
\value{
An \code{R6Class} object of class \code{Hierarchy}
}
\description{
Hierarchy class
}
\details{
on initialize, function sorts the taxon list, see
\link{ranks_ref} for the reference rank names and orders
}
\examples{
(x <- taxon(
  name = taxon_name("Poaceae"),
  rank = taxon_rank("family"),
  id = taxon_id(4479)
))

(y <- taxon(
  name = taxon_name("Poa"),
  rank = taxon_rank("genus"),
  id = taxon_id(4544)
))

(z <- taxon(
  name = taxon_name("Poa annua"),
  rank = taxon_rank("species"),
  id = taxon_id(93036)
))

(res <- hierarchy(z, y, x))

res$taxa
res$ranklist
}
