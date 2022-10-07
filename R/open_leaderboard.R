
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

    #a better approach here will be to include a search athlete id function and require the athlete id to be passed in here
    # if (!is.null(athlete)) {
    #     vec_assert(athlete, size = 1L)

    #     ath <- gsub(" ", "%20", athlete)
        
    #     ath_url <- paste0("https://games.crossfit.com/competitions/api/v1/competitions/open/", year, "/athletes?term=", ath, "&division=", div)

    #     req <- request(ath_url)

    #     req <- req_user_agent(req, "https://github.com/ekholme/crossfitgames")

    #     res <- req_perform(req)

    #     out <- resp_body_json(res)

    #     out
    # }

}