% Generated by roxygen2: do not edit by hand
% Please edit documentation in R/taxmap--docs.R
\name{arrange_obs}
\alias{arrange_obs}
\title{Sort columns of \code{\link[=taxmap]{taxmap()}} objects}
\arguments{
\item{obj}{An object of type \code{\link[=taxmap]{taxmap()}}}

\item{target}{The name of the table in \code{obj$data} to filter}

\item{...}{One or more column names to sort on.}
}
\value{
An object of type \code{\link[=taxmap]{taxmap()}}
}
\description{
Sort columns of tables in \code{obj$data} in \code{\link[=taxmap]{taxmap()}} objects.
Any variable name that appears in \code{obj$all_names()} can be used as if it
was a vector on its own. See \code{\link[dplyr:arrange]{dplyr::arrange()}} for the inspiration
for this function and more information.
\preformatted{
obj$arrange_obs(target, ...)
arrange_obs(obj, target, ...)}
}
\examples{
# Sort in ascending order
arrange_obs(ex_taxmap, "info", n_legs)
arrange_obs(ex_taxmap, "foods", name)

# Sort in decending order
arrange_obs(ex_taxmap, "info", desc(n_legs))

}
\seealso{
Other taxmap manipulation functions: \code{\link{arrange_taxa}},
  \code{\link{filter_obs}}, \code{\link{filter_taxa}},
  \code{\link{mutate_obs}}, \code{\link{sample_frac_obs}},
  \code{\link{sample_frac_taxa}},
  \code{\link{sample_n_obs}}, \code{\link{sample_n_taxa}},
  \code{\link{select_obs}}, \code{\link{transmute_obs}}
}
