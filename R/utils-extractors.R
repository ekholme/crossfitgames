#final_leaderboard utility functions ----------
pull_rank <- function(obj, pos) {
    as.numeric(obj@results$leaderboardRows[[pos]]$overallRank)
}


pull_score <- function(obj, pos) {
    as.numeric(obj@results$leaderboardRows[[pos]]$overallScore)
}

pull_athlete_name <- function(obj, pos) {
    obj@results$leaderboardRows[[pos]]$entrant$competitorName
}

#extract_workout utility funcs ------------
iterate_workouts <- function(obj, workout_num, athlete) {

    ath_name <- obj@results$leaderboardRows[[athlete]]$entrant$competitorName

    tmp <- obj@results$leaderboardRows[[athlete]]$scores[[workout_num]]

    #points work differently in semis and games than in open/quarters
    pts <- if (obj@competition %in% c("games", "semifinals")) {
        as.numeric(tmp$score)
    } else {
        as.numeric(tmp$rank)
    }

    res <- tibble(
        athlete = ath_name,
        workout_num = workout_num,
        workout_place = as.numeric(tmp$rank),
        points = pts,
        score = tmp$scoreDisplay

    )

    res
}