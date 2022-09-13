#' Core Get Response
#' 
#' 

make_request <- function(comp, year, ...) {
    base_url <- "https://c3po.crossfit.com/api/competitions/v2/competitions/"

    comp <- as.character(comp)

    year <- as.integer(year)

    # checking size
    vctrs::vec_assert(comp, size = 1L)
    vctrs::vec_assert(year, size = 1L)

    # adding in request parameters
    params <- list(...)
    
    #constructing request
    req <- httr2::request(base_url)

    #setting user agent
    req <- httr2::req_user_agent(req, "https://github.com/ekholme/crossfitgames")

    req <- httr2::req_url_path_append(req, comp)
    req <- httr2::req_url_path_append(req, year)
    req <- httr2::req_url_path_append(req, "leaderboards")
    req <- httr2::req_url_query(req, !!!params)

    #perform request
    res <- httr2::req_perform(req)

    # convert to json
    out <- httr2::resp_body_json(res)

    out

    ##add class creation here
}