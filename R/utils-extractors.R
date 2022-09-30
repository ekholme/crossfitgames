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