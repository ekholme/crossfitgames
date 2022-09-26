#TODO
#add return_df arg that will return the final leaderboard as a dataframe
games_leaderboard <- function(year, division, return_df = FALSE) {
    comp <- "games"

    res <- make_cfg_request(competition = comp, year = year, division = division)

    res
    
    #TODO implement return_df functionality
}