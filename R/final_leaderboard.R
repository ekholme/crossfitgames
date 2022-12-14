#create a generic to extract the final leaderboard
extract_final_leaderboard <- new_generic("extract_final_leaderboard", "obj")

#' Extract Final Leaderboard
#'
#' @description 
#' Extract the final leaderboard 
#'
#'@param obj A `cfg_leaderboard` object
#'
#'@return 
#' A 3-column tibble with the rank, name, and total points of competitors
#' 
#'@name extract_final_leaderboard
#'@export
#'
#'@examples \dontrun{
#' women_22 <- games_leaderboard(2022, "women")
#' 
#' lb <- extract_final_leaderboard(women_22)
#' }
#'
method(extract_final_leaderboard, cfg_leaderboard) <- function(obj) {
    athletes <- seq_len(length(obj@results$leaderboardRows))

    rs <- map_dbl(athletes, ~ pull_rank(obj, .x))
    ss <- map_dbl(athletes, ~ pull_score(obj, .x))
    nms <- map_chr(athletes, ~ pull_athlete_name(obj, .x))
    
    ret <- tibble(
        rank = rs,
        athlete = nms,
        score = ss
    )

    ret
}
