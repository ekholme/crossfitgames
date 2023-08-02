#' Extract Final Leaderboard
#'
#' @description
#' Extract the final leaderboard
#'
#' @param obj A `cfg_leaderboard` object
#'
#' @return
#' A 3-column tibble with the rank, name, and total points of competitors
#'
#' @name extract_final_leaderboard
#' @method extract_final_leaderboard cfg_leaderboard
#' @export extract_final_leaderboard.cfg_leaderboard
#' @export
#'
#' @examples \dontrun{
#' women_22 <- games_leaderboard(2022, "women")
#'
#' lb <- extract_final_leaderboard(women_22)
#' }
#'
extract_final_leaderboard.cfg_leaderboard <- function(obj) {
    athletes <- seq_len(length(obj$results$leaderboardRows))

    rs <- purrr::map_dbl(athletes, ~ pull_rank(obj, .x))
    ss <- purrr::map_dbl(athletes, ~ pull_score(obj, .x))
    nms <- purrr::map_chr(athletes, ~ pull_athlete_name(obj, .x))

    ret <- tibble::tibble(
        rank = rs,
        athlete = nms,
        score = ss
    )

    ret
}

# create a generic to extract the final leaderboard
extract_final_leaderboard <- function(x) {
    UseMethod("extract_final_leaderboard")
}
