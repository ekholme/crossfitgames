#' Core Make Request Function
#' 
#' @description 
#' This is mostly meant to be an internal function, although in some cases users may want to call it directly
#' 
#' @param competition A length-one character vector indicating the competition to query
#' @param year A length-one integer vector indicating the year to query
#' @param ... Additional parameters passed to the URL as a query string
#' 
#' @export

make_cfg_request <- function(competition, year, ...) {
    # base_url <- "https://c3po.crossfit.com/api/competitions/v2/competitions/"

    # competition <- as.character(competition)

    # year <- as.integer(year)

    # # checking size
    # vec_assert(competition, size = 1L)
    # vec_assert(year, size = 1L)

    # # adding in request parameters
    # params <- list(...)

    # check_query_args(params)

    # #constructing request
    # req <- request(base_url)

    # #setting user agent
    # req <- req_user_agent(req, "https://github.com/ekholme/crossfitgames")

    # #finish constructing request
    # req <- req_url_path_append(req, competition)
    # req <- req_url_path_append(req, year)
    # req <- req_url_path_append(req, "leaderboards")
    # req <- req_url_query(req, !!!params)

    # #perform request
    # res <- req_perform(req)

    # # convert to json
    # out <- resp_body_json(res)

    # #use the class constructor to create an R7 class
    # cfg_leaderboard(
    #     competition = competition,
    #     year = year,
    #     query_parameters = params,
    #     results = out
    # )

    tmp <- base_make_request(competition, year, ...)

    params <- list(...)

    year <- as.integer(year)

    class_cfg_request(
        tmp,
        competition,
        year,
        params
    )

}

base_make_request <- function(competition, year, ...) {
        base_url <- "https://c3po.crossfit.com/api/competitions/v2/competitions/"

        competition <- as.character(competition)

        year <- as.integer(year)

        # checking size
        vec_assert(competition, size = 1L)
        vec_assert(year, size = 1L)

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
        req <- req_url_query(req, !!!params)

        # perform request
        res <- req_perform(req)

        # convert to json
        out <- resp_body_json(res)

        out
}

class_cfg_request <- function(res, comp, year, params) {
        cfg_leaderboard(
            competition = comp,
            year = year,
            query_parameters = params,
            results = res
        )
}

#multiple page cfg request
#useful for open and qf
#work in progress
multi_page_cfg_request <- function(competition, year, n_pages,...) {
    n <- seq_len(n_pages)

    tmp <- map(n, ~base_make_request(competition, year, page = .x, ...))

    tmp
}