% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/taxonomy--docs.R
\name{name_classifications}
\alias{name_classifications}
\title{Get classifications of taxa}
\arguments{
\item{obj}{(\code{\link[=taxmap]{taxmap()}})}

\item{sep}{(\code{character} of length 1) The character(s) to place between
taxon names}
}
\value{
\code{character}
}
\description{
Get classification strings of taxa in an object of type \code{\link[=taxmap]{taxmap()}}
composed of taxon names. Each classification is constructed by concatenating
the taxon names of the given taxon and its supertaxa. \preformatted{
obj$name_classifications(sep = ";") name_classifications(obj, sep = ";")}
}
\examples{
name_classifications(ex_taxmap)

}
\seealso{
Other taxonomy data functions: \code{\link{id_classifications}},
  \code{\link{n_subtaxa_1}}, \code{\link{n_subtaxa}},
  \code{\link{n_supertaxa}}, \code{\link{taxon_ids}},
  \code{\link{taxon_names}}
}
