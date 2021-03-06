% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/taxmap--internal.R
\name{extract_taxon_ids}
\alias{extract_taxon_ids}
\title{Find taxon id info in data set}
\usage{
extract_taxon_ids(x)
}
\arguments{
\item{x}{Something to look for taxon ids in.}
}
\value{
Taxon ids if found, otherwise throw an error.
}
\description{
Look for taxon ids in an object.
For tables, this would be a "taxon_id" column.
For lists/vectors, it would be names.
}
\examples{
taxa:::extract_taxon_ids(ex_taxmap$data$info)

}
\keyword{internal}
