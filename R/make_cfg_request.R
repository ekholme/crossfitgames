#' Core Make Request Function
#' 
#' @description 
#' This is mostly meant to be an internal function, although in some cases users may want to call it directly
#' 
#' @param competition A length-one character vector indicating the competition to query
#' @param year A length-one integer vector indicating the year to query
#' @param page A length-one integer vectory indicating the page to query. Useful for getting data from the open or the quarterfinals where there are more than 50 competitors.
#' @param ... Additional parameters passed to the URL as a query string
#'
#' @name cfg-request
#'  
#' @export

make_cfg_request <- function(competition, year, page = 1, ...) {

    tmp <- base_make_request(competition, year, page, ...)

    params <- list(...)

    year <- as.integer(year)

    class_cfg_request(
        tmp,
        competition,
        year,
        params
    )

}

#internal
base_make_request <- function(competition, year, page = 1, ...) {
        base_url <- "https://c3po.crossfit.com/api/competitions/v2/competitions/"

        competition <- as.character(competition)

        year <- as.integer(year)
        page <- as.integer(page)

        # checking size
        vec_assert(competition, size = 1L)
        vec_assert(year, size = 1L)
        vec_assert(page, size = 1L)

        #adding in page parameter -- useful for open and quarterfinals
        pg <- list(page = page)

        # adding in request parameters
        params <- list(...)

        check_query_args(params)

        # constructing request
        req <- request(base_url)

        # setting user agent
        req <- req_user_agent(req, "https://github.com/ekholme/crossfitgames")

        # finish constructing request
        req <- req_url_path_append(req, competition)
        req <- req_url_path_append(req, year)
        req <- req_url_path_append(req, "leaderboards")
        req <- req_url_query(req, !!!pg)
        req <- req_url_query(req, !!!params)

        # perform request
        res <- req_perform(req)

        # convert to json
        out <- resp_body_json(res)

        out
}

#internal to construct the cfg class from query
class_cfg_request <- function(res, comp, year, params) {
        cfg_leaderboard(
            competition = comp,
            year = year,
            query_parameters = params,
            results = res
        )
}

#' @rdname cfg-request
#' @export
multi_page_cfg_request <- function(competition, year, n_pages,...) {
    n <- seq_len(n_pages)

    # TODO
    # avoid for loop eventually?
    tmp <- vector(mode = "list", length = n_pages)

    for (i in n) {
        tmp[[i]] <- base_make_request(competition, year, page = i, ...)
    }

    lb_r <- purrr::reduce(purrr::transpose(tmp)$leaderboardRows, append)

    res <- tmp[[1]]

    res$leaderboardRows <- lb_r

    params <- list(...)

    year <- as.integer(year)

    class_cfg_request(
            res,
            competition,
            year,
            params
        )

    #TODO
    #clean up metadata at beginning of result
    #although this isn't terribly important bc I'm not using it
}