#' Games Leaderboard
#'
#' @description 
#' Retrive a Crossfit Games leaderboard from the Crossfit API. Functions to further process this data are TODO
#' 
#' @param year The year to request data for, as an integer
#' @param division The competition division to request data for. Currently supports "men", "women", and "teams"
#' @param ... Additional request parameters passed to the API. Not currently used.
#'
#' @return 
#' A `cfg_leaderboard` object
#' 
#' @export
#'
#' @examples \dontrun{
#' men_22 <- games_leaderboard(2022, division = "men")
#' }
#'
games_leaderboard <- function(year, division = c("men", "women", "teams"), ...) {

    # check division vals
    division <- match.arg(division)

    comp <- "games"

    div <- unlist(cfg_divisions[names(cfg_divisions) == division])

    res <- make_cfg_request(competition = comp, year = year, division = div)

    res
    
}