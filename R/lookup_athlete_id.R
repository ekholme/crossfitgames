#' Lookup Athlete ID
#' 
#'@description 
#' Utility function to look up potential athlete ID numbers (and other identifying info). This function will be most useful in helping identify the id number of the athlete you're most interested in, which can then (optionally) be passed to the [open_leaderboard] function to get Crossfit Open results for a specific athlete 
#'  
#'@param name Name of athlete to search for
#' @param year Year of open competition to search for
#' @param division Division to look in. Currently only accepts 'men', 'women', and 'teams'
#' 
#' @return
#' A list with information about athletes matching the 'name' parameter.
#'
#'@export
#'
#'@examples \dontrun{
#' #can pass just a last name
#' res <- lookup_athlete_id("toomey", 2022, "women")
#' 
#' #or you can pass a full name
#' res2 <- lookup_athlete_id("laura horvath", 2022, "women")
#' 
#' }
#'
lookup_athlete_id <- function(name, year, division = c("men", "women", "teams")) {
    vec_assert(name, "character", size = 1L)

    division <- match.arg(division)

    comp <- "open"

    div <- unlist(cfg_divisions[names(cfg_divisions) == division])

    ath <- gsub(" ", "%20", name)

    ath_url <- paste0("https://games.crossfit.com/competitions/api/v1/competitions/open/", year, "/athletes?term=", ath, "&division=", div)

    req <- request(ath_url)

    req <- req_user_agent(req, "https://github.com/ekholme/crossfitgames")

    res <- req_perform(req)

    out <- resp_body_json(res)

    out
}