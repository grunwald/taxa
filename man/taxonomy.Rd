% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/taxonomy--class.R
\name{taxonomy}
\alias{taxonomy}
\title{Taxonomy class}
\usage{
taxonomy(...)
}
\arguments{
\item{...}{Any number of object of class \code{\link[=hierarchy]{hierarchy()}}}
}
\value{
An \code{R6Class} object of class \code{Taxonomy}
}
\description{
Used to store taxonomic tree structures.
}
\details{
on initialize, we parse the inputs and find all duplicate
taxonomic names of the same rank, make an edge list
}
\examples{
# Mammalia
## Notoryctidae
x <- taxon(
  name = taxon_name("Notoryctidae"),
  rank = taxon_rank("family"),
  id = taxon_id(4479)
)
y <- taxon(
  name = taxon_name("Notoryctes"),
  rank = taxon_rank("genus"),
  id = taxon_id(4544)
)
z <- taxon(
  name = taxon_name("Notoryctes typhlops"),
  rank = taxon_rank("species"),
  id = taxon_id(93036)
)

# Mammalia
## Felidae
a <- taxon(
  name = taxon_name("Mammalia"),
  rank = taxon_rank("class"),
  id = taxon_id(9681)
)
b <- taxon(
  name = taxon_name("Felidae"),
  rank = taxon_rank("family"),
  id = taxon_id(9681)
)

c <- taxon(
  name = taxon_name("Puma"),
  rank = taxon_rank("genus"),
  id = taxon_id(146712)
)
d <- taxon(
  name = taxon_name("Puma concolor"),
  rank = taxon_rank("species"),
  id = taxon_id(9696)
)

m <- taxon(
  name = taxon_name("Panthera"),
  rank = taxon_rank("genus"),
  id = taxon_id(146712)
)
n <- taxon(
  name = taxon_name("Panthera tigris"),
  rank = taxon_rank("species"),
  id = taxon_id(9696)
)

# make hierarchies
(hier1 <- hierarchy(z, y, x, a))
(hier2 <- hierarchy(c, b, a, d))
(hier3 <- hierarchy(n, m, b, a))

(hrs <- hierarchies(hier1, hier2, hier3))

# make taxonomy
taxonomy(hier1, hier2, hier3)



}
