#' Get data indexes associated with taxa
#'
#' Given a \code{\link{taxmap}} object, return the indexes associated with each
#' taxon in a given table included in that \code{\link{taxmap}} object.
#' \preformatted{ obj$obs(data, subset = NULL, recursive = TRUE, simplify =
#' FALSE) obs(obj, data, subset = NULL, recursive = TRUE, simplify = FALSE)}
#'
#' @param obj (\code{\link{taxmap}}) The \code{\link{taxmap}} object containing
#'   taxon information to be queried.
#' @param data Either the name of something in \code{obj$data} that has taxon
#'   information or a an external object with taxon information. For tables,
#'   there must be a column named "taxon_id" and lists/vectors must be named by
#'   taxon ID.
#' @param subset (\code{character}) Taxon IDs or indexes for which observation
#'   indexes will be returned. Default: All taxa in \code{obj} will be used.
#' @param recursive (\code{logical}) If \code{FALSE}, only return the
#'   observation assigned to the specified input taxa, not subtaxa. If
#'   \code{TRUE}, return all the observations of every subtaxa, etc.
#' @param simplify (\code{logical}) If \code{TRUE}, then combine all the results
#'   into a single vector of unique observation indexes.
#'
#' @return If \code{simplify = FALSE}, then a list of vectors of observation
#'   indexes are returned corresponding to the \code{target} argument. If
#'   \code{simplify = TRUE}, then the observation indexes for all \code{target}
#'   taxa are returned in a single vector.
#'
#' @family taxmap taxonomy functions
#'
#' @name obs
#'
#' @examples
#' # Get indexes of rows corresponding to each taxon
#' ex_taxmap$obs("info")
#'
#' # Get only a subset of taxon indexes
#' ex_taxmap$obs("info", subset = 1:2)
#'
#' # Get only a subset of taxon IDs
#' ex_taxmap$obs("info", subset = c("1", "2"))
#'
#' # Only return indexes of rows assinged to each taxon explicitly
#' ex_taxmap$obs("info", recursive = FALSE)
#'
#' # Lump all row indexes in a single vector
#' ex_taxmap$obs("info", simplify = TRUE)
#'
NULL


#' Return names of data in a \code{\link{taxmap}}
#'
#' Return all the valid names that can be used with non-standard evalulation in
#' manipulation functions like \code{filter_taxa}. \preformatted{
#' obj$all_names(tables = TRUE, funcs = TRUE, others = TRUE, warn = FALSE)
#' all_names(obj, tables = TRUE, funcs = TRUE, others = TRUE, warn = FALSE)}
#'
#' @param obj (\code{\link{taxmap}}) The \code{\link{taxmap}} object containing
#'   taxon information to be queried.
#' @param tables If \code{TRUE}, include the names of columns of tables in
#'   \code{obj$data}
#' @param funcs If \code{TRUE}, include the names of user-definable functionsin
#'   \code{obj$funcs}.
#' @param others If \code{TRUE}, include the names of data in \code{obj$data}
#'   besides tables.
#' @param builtin_funcs If \code{TRUE}, include functions like
#'   \code{\link{n_supertaxa}} that provide information for each taxon.
#' @param warn If \code{TRUE}, warn if there are duplicate names.
#'
#' @return \code{character}
#'
#' @examples
#' # Get the names of all data accesible by non-standard evaluation
#' ex_taxmap$all_names()
#'
#' # Dont include the names of functions
#' ex_taxmap$all_names(funcs = FALSE)
#'
#' @family accessors
#'
#' @name all_names
NULL


#' Get names of data used in expressions
#'
#' Get names of available data used in expressions.
#' Expressions are not evaluated and do not need to make sense.
#' \preformatted{
#' obj$names_used(...)
#' names_used(obj,...)}
#'
#' @param obj a \code{\link{taxmap}} object
#' @param ... One or more expressions
#'
#' @return Named \code{character}
#'
#' @examples
#' ex_taxmap$names_used(n_legs + dangerous == invalid_expression)
#'
#' @family accessors
#'
#' @name names_used
NULL


#' Get data in a taxmap object by name
#'
#' Given a vector of names, return a list of data contained in a
#' \code{\link{taxmap}} object. \preformatted{
#' obj$get_data(name)
#' get_data(obj, name)}
#'
#' @param obj A \code{\link{taxmap}}  object
#' @param name (\code{character}) Names of data to return.
#'
#' @return \code{list}
#'
#' @examples
#' ex_taxmap$get_data("reaction")
#'
#' @family accessors
#'
#' @name get_data
NULL


#' Get values of data used in expressions
#'
#' Get values of data in a \code{\link{taxmap}} used in expressions.
#' Expressions are not evaluated and do not need to make sense.
#' \preformatted{
#' obj$data_used(...)
#' data_used(obj, ...)}
#'
#' @param obj a \code{\link{taxmap}} object
#' @param ... One or more expressions
#'
#' @return \code{list}
#'
#' @examples
#' ex_taxmap$data_used(n_legs + dangerous == invalid_expression)
#'
#' @family accessors
#'
#' @name data_used
NULL


#' Get values of all data
#'
#' Get values of all data in a \code{\link{taxmap}} object
#' \preformatted{
#' obj$data_used(...)
#' data_used(obj, ...)}
#'
#' @param obj a \code{\link{taxmap}} object
#' @param ... Passed to \code{\link{all_names}}
#'
#' @return Named \code{list}
#'
#' @examples
#' ex_taxmap$all_data()
#'
#' @family accessors
#'
#' @name all_data
NULL


#' Filter taxa with a list of conditions
#'
#' Filter taxa in a \code{\link{taxmap}} object with a series of conditions. Any
#' variable name that appears in \code{obj$all_names()} can be used as if it was
#' a vector on its own. See \code{\link[dplyr]{filter}} for the inspiration for
#' this function and more information. Calling the function using the
#' \code{obj$filter_taxa(...)} style edits "obj" in place, unlike most R
#' functions. However, calling the function using the \code{filter_taxa(obj,
#' ...)} mitates R's traditional copy-on-modify semantics, so "obj" would not be
#' changed; instead a changed version would be returned, like most R functions.
#' \preformatted{ obj$filter_taxa(..., subtaxa = FALSE, supertaxa = FALSE,
#' taxonless = FALSE, reassign_obs = TRUE, reassign_taxa = TRUE, invert = FALSE)
#' filter_taxa(obj, ...)}
#'
#' @param obj An object of class \code{\link{taxmap}}
#' @param ... One or more filtering conditions. Each filtering condition can be
#'   one of three things: \describe{ \item{\code{character}}{One or more taxon
#'   IDs contained in \code{obj$edge_list$to}} \item{\code{integer}}{One or more
#'   row indexes of \code{obj$edge_list}} \item{\code{logical}}{A
#'   \code{TRUE}/\code{FALSE} vector of length equal to the number of rows in
#'   \code{obj$edge_list}} } Any variable name that appears in
#'   \code{obj$all_names()} can be used as if it was a vector on its own.
#' @param subtaxa (\code{logical} of length 1) If \code{TRUE}, include subtaxa
#'   of taxa passing the filter.
#' @param supertaxa (\code{logical} of length 1) If \code{TRUE}, include
#'   supertaxa of taxa passing the filter.
#' @param taxonless (\code{logical}) If \code{TRUE}, include observations even
#'   if the taxon they are assigned to is filtered out. Observations assigned to
#'   removed taxa will be assigned to \code{NA}. This option can be either
#'   simply \code{TRUE}/\code{FALSE}, meaning that all data sets will be treated
#'   the same, or a logical vector can be supplied with names corresponding one
#'   or more data sets in \code{obj$data}. For example, \code{c(abundance =
#'   TRUE, stats = FALSE)} would inlcude observations whose taxon was filtered
#'   out in \code{obj$data$abundance}, but not in \code{obj$data$stats}. See the
#'   \code{reassign_obs} option below for further complications.
#' @param reassign_obs (\code{logical} of length 1) If \code{TRUE}, observations
#'   assigned to removed taxa will be reassigned to the closest supertaxon that
#'   passed the filter. If there are no supertaxa of such an observation that
#'   passed the filter, they will be filtered out if \code{taxonless} is
#'   \code{TRUE}. This option can be either simply \code{TRUE}/\code{FALSE},
#'   meaning that all data sets will be treated the same, or a logical vector
#'   can be supplied with names corresponding one or more data sets in
#'   \code{obj$data}. For example, \code{c(abundance = TRUE, stats = FALSE)}
#'   would reassign observations in \code{obj$data$abundance}, but not in
#'   \code{obj$data$stats}.
#' @param reassign_taxa (\code{logical} of length 1) If \code{TRUE}, subtaxa of
#'   removed taxa will be reassigned to the closest supertaxon that passed the
#'   filter. This is useful for removing intermediate levels of a taxonomy.
#' @param invert (\code{logical} of length 1) If \code{TRUE}, do NOT include the
#'   selection. This is different than just replacing a \code{==} with a
#'   \code{!=} because this option negates the selection after taking into
#'   account the \code{subtaxa} and \code{supertaxa} options. This is useful for
#'   removing a taxon and all its subtaxa for example.
#'
#' @return An object of type \code{\link{taxmap}}
#'
#' @examples
#' # Filter by index
#' filter_taxa(ex_taxmap, 1:3)
#'
#' # Filter by taxon ID
#' filter_taxa(ex_taxmap, c("1", "2", "3"))
#'
#' # Fiter by TRUE/FALSE
#' filter_taxa(ex_taxmap, taxon_names == "Plantae", subtaxa = TRUE)
#'
#' # Filter by an observation characteristic
#' dangerous_taxa <- sapply(ex_taxmap$obs("info"),
#'                          function(i) any(ex_taxmap$data$info$dangerous[i]))
#' filter_taxa(ex_taxmap, dangerous_taxa)
#'
#' # Include supertaxa
#' filter_taxa(ex_taxmap, 12, supertaxa = TRUE)
#'
#' # Include subtaxa
#' filter_taxa(ex_taxmap, 1, subtaxa = TRUE)
#'
#' # Remove rows in data corresponding to removed taxa
#' filter_taxa(ex_taxmap, 2, taxonless = c(info = FALSE))
#'
#' # Remove a taxon and it subtaxa
#' filter_taxa(ex_taxmap, 1, subtaxa = TRUE, invert = TRUE)
#'
#' @family dplyr-like functions
#'
#' @name filter_taxa
NULL


#' Filter observations with a list of conditions
#'
#' Filter data in a \code{\link{taxmap}} (in \code{obj$data}) object with a
#' series of conditions. Any variable name that appears in
#' \code{obj$all_names()} can be used as if it was a vector on its own. See
#' \code{\link[dplyr]{filter}} for the inspiration for this function and more
#' information. Calling the function using the \code{obj$filter_obs(...)} style
#' edits "obj" in place, unlike most R functions. However, calling the function
#' using the \code{filter_obs(obj, ...)} mitates R's traditional copy-on-modify
#' semantics, so "obj" would not be changed; instead a changed version would be
#' returned, like most R functions. \preformatted{ obj$filter_obs(target, ...,
#' unobserved = TRUE) filter_obs(obj, target, ...)}
#'
#' @param obj An object of type \code{\link{taxmap}}
#' @param target The name of the list/vector/table in \code{obj$data} to filter
#' @param ... One or more filtering conditions. Each filtering condition can be
#'   one of three things: \describe{ \item{\code{character}}{One or more taxon
#'   IDs contained in \code{obj$edge_list$to}} \item{\code{integer}}{One or more
#'   row indexes of \code{obj$edge_list}} \item{\code{logical}}{A
#'   \code{TRUE}/\code{FALSE} vector of length equal to the number of rows in
#'   \code{obj$edge_list}} } Any variable name that appears in
#'   \code{obj$all_names()} can be used as if it was a vector on its own.
#' @param unobserved (\code{logical} of length 1) If \code{TRUE}, preserve taxa
#'   even if all of their observations are filtered out. If \code{FALSE}, remove
#'   taxa for which all observations were filtered out. Note that only taxa that
#'   are unobserved due to this filtering will be removed; there might be other
#'   taxa without observations to begin with that will not be removed.
#'
#' @return An object of type \code{\link{taxmap}}
#'
#' @examples
#' # Filter by row index
#' filter_obs(ex_taxmap, "info", 1:2)
#'
#' # Filter by TRUE/FALSE
#' filter_obs(ex_taxmap, "info", dangerous == FALSE)
#'
#' # Remove taxa whose obserservation were filtered out
#' filter_obs(ex_taxmap, "info", dangerous == FALSE, unobserved = FALSE)
#'
#' @family dplyr-like functions
#'
#' @name filter_obs
NULL


#' Subset columns in a \code{\link{taxmap}} object
#'
#' Subsets columns in a \code{\link{taxmap}} object. Takes and returns a
#' \code{\link{taxmap}} object. Any variable name that appears in
#' \code{obj$all_names()} can be used as if it was a vector on its own. See
#' \code{\link[dplyr]{select}} for the inspiration for this function and more
#' information. Calling the function using the \code{obj$select_obs(...)} style
#' edits "obj" in place, unlike most R functions. However, calling the function
#' using the \code{select_obs(obj, ...)} mitates R's traditional copy-on-modify
#' semantics, so "obj" would not be changed; instead a changed version would be
#' returned, like most R functions. \preformatted{ obj$select_obs(target, ...,
#' unobserved = TRUE) select_obs(obj, target, ...)}
#'
#' @param obj An object of type \code{\link{taxmap}}
#' @param target The name of the list/vector/table in \code{obj$data} to filter
#' @param ... One or more column names to return in the new object. Each can be
#'   one of two things: \describe{ \item{expression with unquoted column
#'   name}{The name of a column in \code{obj$data[[target]]} typed as if it was
#'   a varaible on its own.} \item{\code{numeric}}{Indexes of columns in
#'   \code{obj$data[[target]]}} } To match column names with a character vector,
#'   use \code{matches("my_col_name")}. To match a logical vector, convert it to
#'   a column index using \code{\link[base]{which}}.
#'
#' @return An object of type \code{\link{taxmap}}
#'
#' @family dplyr-like functions
#'
#' @examples
#' # Selecting a column by name
#' select_obs(ex_taxmap, "info", dangerous)
#'
#' # Selecting a column by index
#' select_obs(ex_taxmap, "info", 3)
#'
#' # Selecting a column by regular expressions
#' select_obs(ex_taxmap, "info", matches("^n"))
#'
#' @name select_obs
NULL


#' Add columns to \code{\link{taxmap}} objects
#'
#' Add columns to tables in \code{obj$data} in \code{\link{taxmap}} objects. Any
#' variable name that appears in \code{obj$all_names()} can be used as if it was
#' a vector on its own. See \code{\link[dplyr]{mutate}} for the inspiration for
#' this function and more information. Calling the function using the
#' \code{obj$mutate_obs(...)} style edits "obj" in place, unlike most R
#' functions. However, calling the function using the \code{mutate_obs(obj,
#' ...)} mitates R's traditional copy-on-modify semantics, so "obj" would not be
#' changed; instead a changed version would be returned, like most R functions.
#' \preformatted{ obj$mutate_obs(target, ...) mutate_obs(obj, target, ...)}
#'
#' @param obj An object of type \code{\link{taxmap}}
#' @param target The name of the table in \code{obj$data} to filter
#' @param ... One or more named columns to add. Newly created columns can be
#'   referenced in the same function call.
#'
#' @return An object of type \code{\link{taxmap}}
#'
#' @examples
#' mutate_obs(ex_taxmap, "info",
#'            new_col = "Im new",
#'            newer_col = paste0(new_col, "er!"))
#'
#' @family dplyr-like functions
#' @name mutate_obs
NULL


#' Replace columns in \code{\link{taxmap}} objects
#'
#' Replace columns of tables in \code{obj$data} in \code{\link{taxmap}} objects.
#' Any variable name that appears in \code{obj$all_names()} can be used as if it
#' was a vector on its own. See \code{\link[dplyr]{transmute}} for the
#' inspiration for this function and more information. \preformatted{
#' obj$transmute_obs(target, ...) transmute_obs(obj, target, ...)}
#'
#' @param obj An object of type \code{\link{taxmap}}
#' @param target The name of the table in \code{obj$data} to filter
#' @param ... One or more named columns to add. Newly created columns can be
#'   referenced in the same function call.
#'
#' @return An object of type \code{\link{taxmap}}
#' @examples
#' transmute_obs(ex_taxmap, "info", new_col = paste0(name, "!!!"))
#'
#' @family dplyr-like functions
#'
#' @name transmute_obs
NULL


#' Sort columns of \code{\link{taxmap}} objects
#'
#' Sort columns of tables in \code{obj$data} in \code{\link{taxmap}} objects.
#' Any variable name that appears in \code{obj$all_names()} can be used as if it
#' was a vector on its own. See \code{\link[dplyr]{arrange}} for the inspiration
#' for this function and more information. \preformatted{
#' obj$arrange_obs(target, ...) arrange_obs(obj, target, ...)}
#'
#' @param obj An object of type \code{\link{taxmap}}
#' @param target The name of the table in \code{obj$data} to filter
#' @param ... One or more column names to sort on.
#'
#' @return An object of type \code{\link{taxmap}}
#'
#' @examples
#' # Sort in ascending order
#' arrange_obs(ex_taxmap, "info", n_legs)
#'
#' # Sort in decending order
#' arrange_obs(ex_taxmap, "info", desc(n_legs))
#'
#' @family dplyr-like functions
#'
#' @name arrange_obs
NULL


#' Sort the edge list of \code{\link{taxmap}} objects
#'
#' Sort the edge list in \code{\link{taxmap}} objects. Any variable name that
#' appears in \code{obj$all_names()} can be used as if it was a vector on its
#' own. See \code{\link[dplyr]{arrange}} for the inspiration for this function
#' and more information. \preformatted{ obj$arrange_taxa(...) arrange_taxa(obj,
#' ...)}
#'
#' @param obj \code{\link{taxmap}}
#' @param ... One or more column names to sort on.
#'
#' @return An object of type \code{\link{taxmap}}
#'
#' @examples
#' arrange_taxa(ex_taxmap, desc(ex_taxmap$taxon_names()))
#'
#' @family dplyr-like functions
#'
#' @name arrange_taxa
NULL


#' Sample n observations from \code{\link{taxmap}}
#'
#' Randomly sample some number of observations from a \code{\link{taxmap}}
#' object. Weights can be specified for observations or the taxa they are taxmap
#' by. Any variable name that appears in \code{obj$all_names()} can be used as
#' if it was a vector on its own. See \link[dplyr]{sample_n} for the inspiration
#' for this function. \preformatted{ obj$sample_n_obs(target, size, replace =
#' FALSE, taxon_weight = NULL, obs_weight = NULL, use_supertaxa = TRUE,
#' collapse_func = mean, ...) sample_n_obs(obj, target, size, replace = FALSE,
#' taxon_weight = NULL, obs_weight = NULL, use_supertaxa = TRUE, collapse_func =
#' mean, ...)}
#'
#' @param obj (\code{\link{taxmap}}) The object to sample from.
#' @param target The name of the table in \code{obj$data} to filter
#' @param size (\code{numeric} of length 1) The number of observations to
#'   sample.
#' @param replace (\code{logical} of length 1) If \code{TRUE}, sample with
#'   replacement.
#' @param taxon_weight (\code{numeric}) Non-negative sampling weights of each
#'   taxon. If \code{use_supertaxa} is \code{TRUE}, the weights for each taxon
#'   in an observation's classification are supplied to \code{collapse_func} to
#'   get the observation weight. If \code{obs_weight} is also specified, the two
#'   weights are multiplied (after \code{taxon_weight} for each observation is
#'   calculated).
#' @param obs_weight (\code{numeric}) Sampling weights of each observation.  If
#'   \code{taxon_weight} is also specified, the two weights are multiplied
#'   (after \code{taxon_weight} for each observation is calculated).
#' @param use_supertaxa (\code{logical} of length 1) Affects how the
#'   \code{taxon_weight} is used. If \code{TRUE}, the weights for each taxon in
#'   an observation's classification are multiplied to get the observation
#'   weight. Otherwise, just the taxonomic level the observation is assign to it
#'   considered.
#' @param collapse_func (\code{function} of length 1) If \code{taxon_weight}
#'   option is used and \code{supertaxa} is \code{TRUE}, the weights for each
#'   taxon in an observation's classification are supplied to
#'   \code{collapse_func} to get the observation weight. This function should
#'   take  numeric vector and return a single number.
#' @param ... Additional options are passed to \code{\link{filter_obs}}.
#'
#' @return An object of type \code{\link{taxmap}}
#'
#' @examples
#' # Sample 2 rows without replacement
#' sample_n_obs(ex_taxmap, "info", 2)
#'
#' # Sample with replacement
#' sample_n_obs(ex_taxmap, "info", 10, replace = TRUE)
#'
#' # Sample some rows for often then others
#' sample_n_obs(ex_taxmap, "info", 3, obs_weight = n_legs)
#'
#' @family dplyr-like functions
#' @name sample_n_obs
NULL


#' Sample a proportion of observations from \code{\link{taxmap}}
#'
#' Randomly sample some propoortion of observations from a \code{\link{taxmap}}
#' object. Weights can be specified for observations or their taxa. See
#' \link[dplyr]{sample_frac} for the inspiration for this function.
#' \preformatted{ obj$sample_frac_obs(target, size, replace = FALSE,
#' taxon_weight = NULL, obs_weight = NULL, use_supertaxa = TRUE, collapse_func =
#' mean, ...) sample_frac_obs(obj, target, size, replace = FALSE, taxon_weight =
#' NULL, obs_weight = NULL, use_supertaxa = TRUE, collapse_func = mean, ...)}
#'
#' @param obj (\code{\link{taxmap}}) The object to sample from.
#' @param target The name of the table in \code{obj$data} to filter
#' @param size (\code{numeric} of length 1) The proportion of observations to
#'   sample.
#' @param replace (\code{logical} of length 1) If \code{TRUE}, sample with
#'   replacement.
#' @param taxon_weight (\code{numeric}) Non-negative sampling weights of each
#'   taxon. If \code{use_supertaxa} is \code{TRUE}, the weights for each taxon
#'   in an observation's classification are supplied to \code{collapse_func} to
#'   get the observation weight. If \code{obs_weight} is also specified, the two
#'   weights are multiplied (after \code{taxon_weight} for each observation is
#'   calculated).
#' @param obs_weight (\code{numeric}) Sampling weights of each observation.  If
#'   \code{taxon_weight} is also specified, the two weights are multiplied
#'   (after \code{taxon_weight} for each observation is calculated).
#' @param use_supertaxa (\code{logical} of length 1) Affects how the
#'   \code{taxon_weight} is used. If \code{TRUE}, the weights for each taxon in
#'   an observation's classification are multiplied to get the observation
#'   weight. Otherwise, just the taxonomic level the observation is assign to it
#'   considered.
#' @param collapse_func (\code{function} of length 1) If \code{taxon_weight}
#'   option is used and \code{supertaxa} is \code{TRUE}, the weights for each
#'   taxon in an observation's classification are supplied to
#'   \code{collapse_func} to get the observation weight. This function should
#'   take  numeric vector and return a single number.
#' @param ... Additional options are passed to \code{\link{filter_obs}}.
#'
#' @return An object of type \code{\link{taxmap}}
#'
#' @examples
#' sample_frac_obs(ex_taxmap, "info", 0.5)
#'
#' @family dplyr-like functions
#' @name sample_frac_obs
NULL


#' Sample n taxa from \code{\link{taxmap}}
#'
#' Randomly sample some number of taxa from a \code{\link{taxmap}} object.
#' Weights can be specified for taxa or the observations assigned to them. See
#' \link[dplyr]{sample_n} for the inspiration for this function. \preformatted{
#' obj$sample_n_taxa(size, taxon_weight = NULL, obs_weight = NULL, obs_target =
#' NULL, use_subtaxa = TRUE, collapse_func = mean, ...) sample_n_taxa(obj, size,
#' taxon_weight = NULL, obs_weight = NULL, obs_target = NULL, use_subtaxa =
#' TRUE, collapse_func = mean, ...)}
#'
#' @param obj (\code{\link{taxmap}}) The object to sample from.
#' @param size (\code{numeric} of length 1) The number of taxa to sample.
#' @param taxon_weight (\code{numeric}) Non-negative sampling weights of each
#'   taxon. If \code{obs_weight} is also specified, the two weights are
#'   multiplied (after \code{obs_weight} for each taxon is calculated).
#' @param obs_weight (\code{numeric}) Sampling weights of each observation. The
#'   weights for each observation assigned to a given taxon are supplied to
#'   \code{collapse_func} to get the taxon weight. If \code{use_subtaxa} is
#'   \code{TRUE} then the observations assigned to every subtaxa are also used.
#'   Any variable name that appears in \code{obj$all_names()} can be used as if
#'   it was a vector on its own. If \code{taxon_weight} is also specified, the
#'   two weights are multiplied (after \code{obs_weight} for each observation is
#'   calculated). \code{obs_target} must be used with this option.
#' @param obs_target (\code{character} of length 1) The name of the data set in
#'   \code{obj$data} that values in \code{obs_weight} corresponds to. Must be
#'   used when \code{obs_weight} is used.
#' @param use_subtaxa (\code{logical} of length 1) Affects how the
#'   \code{obs_weight} option is used. If \code{TRUE}, the weights for each
#'   taxon in an observation's classification are multiplied to get the
#'   observation weight. Otherwise, just the taxonomic level the observation is
#'   assign to it considered.
#' @param collapse_func (\code{function} of length 1) If \code{taxon_weight} is
#'   used and \code{supertaxa} is \code{TRUE}, the weights for each taxon in an
#'   observation's classification are supplied to \code{collapse_func} to get
#'   the observation weight. This function should take  numeric vector and
#'   return a single number.
#' @param ... Additional options are passed to \code{\link{filter_taxa}}.
#'
#' @return An object of type \code{\link{taxmap}}
#'
#' @examples
#' # Randomly sample three taxa
#' sample_n_taxa(ex_taxmap, 3)
#'
#' # Include supertaxa
#' sample_n_taxa(ex_taxmap, 3, supertaxa = TRUE)
#'
#' # Include subtaxa
#' sample_n_taxa(ex_taxmap, 1, subtaxa = TRUE)
#'
#' # Sample some taxa more often then others
#' sample_n_taxa(ex_taxmap, 3, supertaxa = TRUE,
#'               obs_weight = n_legs, obs_target = "info")
#'
#' @family dplyr-like functions
#'
#' @name sample_n_taxa
NULL


#' Sample a proportion of taxa from \code{\link{taxmap}}
#'
#' Randomly sample some proportion of taxa from a \code{\link{taxmap}} object.
#' Weights can be specified for taxa or the observations assigned to them. See
#' \link[dplyr]{sample_frac} for the inspiration for this function.
#' \preformatted{ obj$sample_frac_taxa(size, taxon_weight = NULL, obs_weight =
#' NULL, obs_target = NULL, use_subtaxa = TRUE, collapse_func = mean, ...)
#' sample_frac_taxa(obj, size, taxon_weight = NULL, obs_weight = NULL,
#' obs_target = NULL, use_subtaxa = TRUE, collapse_func = mean, ...)}
#'
#' @param obj (\code{\link{taxmap}}) The object to sample from.
#' @param size (\code{numeric} of length 1) The proportion of taxa to sample.
#' @param taxon_weight (\code{numeric}) Non-negative sampling weights of each
#'   taxon. If \code{obs_weight} is also specified, the two weights are
#'   multiplied (after \code{obs_weight} for each taxon is calculated).
#' @param obs_weight (\code{numeric}) Sampling weights of each observation. The
#'   weights for each observation assigned to a given taxon are supplied to
#'   \code{collapse_func} to get the taxon weight. If \code{use_subtaxa} is
#'   \code{TRUE} then the observations assigned to every subtaxa are also used.
#'   Any variable name that appears in \code{obj$all_names()} can be used as if
#'   it was a vector on its own. If \code{taxon_weight} is also specified, the
#'   two weights are multiplied (after \code{obs_weight} for each observation is
#'   calculated). \code{obs_target} must be used with this option.
#' @param obs_target (\code{character} of length 1) The name of the data set in
#'   \code{obj$data} that values in \code{obs_weight} corresponds to. Must be
#'   used when \code{obs_weight} is used.
#' @param use_subtaxa (\code{logical} of length 1) Affects how the
#'   \code{obs_weight} option is used. If \code{TRUE}, the weights for each
#'   taxon in an observation's classification are multiplied to get the
#'   observation weight. Otherwise, just the taxonomic level the observation is
#'   assign to it considered.
#' @param collapse_func (\code{function} of length 1) If \code{taxon_weight} is
#'   used and \code{supertaxa} is \code{TRUE}, the weights for each taxon in an
#'   observation's classification are supplied to \code{collapse_func} to get
#'   the observation weight. This function should take  numeric vector and
#'   return a single number.
#' @param ... Additional options are passed to \code{\link{filter_taxa}}.
#'
#' @return An object of type \code{\link{taxmap}}
#'
#'
#' @examples
#' sample_frac_taxa(ex_taxmap, 0.5, supertaxa = TRUE)
#'
#' @family dplyr-like functions
#'
#' @name sample_frac_taxa
NULL


#' Count observations in \code{\link{taxmap}}
#'
#' Count observations for each taxon in a \code{\link{taxmap}} object.
#' This includes observations for the specific taxon and its subtaxa.
#' \preformatted{
#' obj$n_obs(target)
#' n_obs(obj, target)}
#'
#' @param obj (\code{\link{taxmap}})
#' @param target The name of the list/vector/table in \code{obj$data}
#'
#' @return \code{numeric}
#'
#' @examples
#' n_obs(ex_taxmap, "info")
#'
#' @family taxon_funcs
#'
#' @name n_obs
NULL


#' Count observation assigned in \code{\link{taxmap}}
#' Count observations assigned to a specific taxon in an \code{\link{taxmap}}.
#' This does not include observations assigned to subtaxa.
#' \preformatted{
#' obj$n_obs_1(target)
#' n_obs_1(obj, target)}
#'
#' @param obj (\code{\link{taxmap}})
#' @param target The name of the list/vector/table in \code{obj$data}
#'
#' @return \code{numeric}
#'
#' @examples#' n_obs_1(ex_taxmap, "info")
#'
#' @family taxon_funcs
#'
#' @name n_obs_1
NULL