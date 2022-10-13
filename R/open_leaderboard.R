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
open_leaderboard <- function(year, division = c("men", "women", "teams"), athlete = NULL, ...) {

    #division checks
    division <- match.arg(division)

    comp <- "open"

    div <- unlist(cfg_divisions[names(cfg_divisions) == division])

    res <- if (!is.null(athlete)) {

        tmp <- make_cfg_request(competition = comp, year = year, division = div, athlete = athlete)

        iter <- seq_len(length(tmp@results$leaderboardRows))

        ind <- map_lgl(iter, function(x) {
            tmp@results$leaderboardRows[[x]]$entrant$competitorId == athlete
        })

        pulled <- tmp@results$leaderboardRows[[which(ind)]]

        pulled

    } else {

        make_cfg_request(competition = comp, year = year, division = div, ...)

    }

    res

}