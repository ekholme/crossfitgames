# # create a generic to extract individual workout results
# extract_workout_results <- R7::new_generic("extract_workout_results", "obj")

# #' Extract Workout Results
# #'
# #' @description
# #' Extract individual workout results from a `cfg_leaderboard` object
# #'
# #' @param obj A `cfg_leaderboard` object
# #'
# #' @return
# #' A 5-column tibble including
# #' \describe{
# #' \item{athlete}{Athlete name}
# #' \item{workout_num}{Workout number}
# #' \item{workout_place}{Finishing position of the athlete in the workout}
# #' \item{points}{Number of points earned in workout}
# #' \item{score}{Recorded score for workout in time, weight, reps, etc}
# #' }
# #'
# #' @name extract_workout_results
# #' @export
# #'
# #' @examples \dontrun{
# #' women_22 <- games_leaderboard(2022, "women")
# #'
# #' indiv_results <- extract_workout_results(women_22)
# #' }
# #'
# R7::method(extract_workout_results, cfg_leaderboard) <- function(obj) {

#     workout_nums <- seq_len(length(obj$results$ordinals))

#     athletes <- seq_len(length(obj$results$leaderboardRows))

#     iter <- expand.grid(workout_nums, athletes)

#     names(iter) <- c("workout_num", "athlete")

#     res <- purrr::pmap_dfr(iter, ~iterate_workouts(obj, ..1, ..2))

#     res

# }
