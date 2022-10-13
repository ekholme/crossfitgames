#' Open Leaderboard
#'
#' @description
#' Retrieve a Crossfit Open leaderboard from the Crossfit API. Functions to further process this data are TODO
#'
#' @param year The year to request data for, as an integer
#' @param division The competition division to request data for. Currently supports "men", "women", and "teams"
#' @param athlete Optional parameter. If not `NULL`, then the unique ID number for the athlete. If provided, this will return the results (as a list) for that athlete. See [lookup_athlete_id] for a function to help determine the athlete's id.
#' @param ... Additional request parameters passed to the API. These might include the region, or scaling status (i.e. were workouts completed as Rx or scaled).
#'
#' @return
#' A `cfg_leaderboard` object if `athlete` is NULL. If `athlete` is not NULL, then a list.
#'
#' @export
#'
#' @examples \dontrun{
#' #will return the top 50 athletes
#' men_22 <- open_leaderboard(2022, division = "men")
#' 
#' north_am_women <- open_leaderboard(2022, division = "women", region = 31)
#' 
#' #specifying an individual athlete with an id number
#' #the number provided corresponds to laura horvath
#' lh <- 591912
#' lh_open <- open_leaderboard(2022, division = "women", athlete = lh)
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