#' @keywords internal
#' helper function to check query arguments sent to `make_cfg_request`
check_query_args <- function(params) {

    checks <- intersect(names(params), names(all_data))

    for (i in checks) {

        a <- params[[i]]
        b <- unlist(all_data[[i]])

        if (!a %in% b) {
            abort(
                paste0(i, " must be one of ", paste0(b, collapse = ", "), "; not ", a)
            )
        }
    }

}