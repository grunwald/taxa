% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/taxon_name.R
\name{taxon_name}
\alias{taxon_name}
\title{TaxonName class}
\usage{
taxon_name(name, database = NULL)
}
\arguments{
\item{name}{(character) a taxonomic name. required}

\item{database}{(character) database class object, optional}
}
\value{
An \code{R6Class} object of class \code{TaxonName}
}
\description{
TaxonName class
}
\examples{
(poa <- taxon_name("Poa"))
(undef <- taxon_name("undefined"))
(sp1 <- taxon_name("species 1"))
(poa_annua <- taxon_name("Poa annua"))
(x <- taxon_name("Poa annua L."))

x$name
x$database

(x <- taxon_name(
  "Poa annua",
  database_list$ncbi
))
x$rank
x$database
}
