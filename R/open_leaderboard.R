
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

        make_cfg_request(competition = comp, year = year, division = div)

    }

    res

}