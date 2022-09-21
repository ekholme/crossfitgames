#' Core Make Request Function
#' 

make_cfg_request <- function(competition, year, ...) {
    base_url <- "https://c3po.crossfit.com/api/competitions/v2/competitions/"

    competition <- as.character(competition)

    year <- as.integer(year)

    # checking size
    vec_assert(competition, size = 1L)
    vec_assert(year, size = 1L)

    # adding in request parameters
    params <- list(...)

    check_query_args(params)
    
    #constructing request
    req <- request(base_url)

    #setting user agent
    req <- req_user_agent(req, "https://github.com/ekholme/crossfitgames")

    #finish constructing request
    req <- req_url_path_append(req, competition)
    req <- req_url_path_append(req, year)
    req <- req_url_path_append(req, "leaderboards")
    req <- req_url_query(req, !!!params)

    #perform request
    res <- req_perform(req)

    # convert to json
    out <- resp_body_json(res)

    #use the class constructor to create an R7 class
    cfg_leaderboard(
        competition = competition,
        year = year,
        query_parameters = params,
        result = out
    )

}