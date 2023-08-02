# document later
new_cfg_leaderboard <- function(competition, year, query_parameters, results) {
    # checks
    stopifnot(is.character(competition))
    stopifnot(is.integer(year))
    stopifnot(is.list(query_parameters))
    stopifnot(is.list(results))

    structure(
        list(
            competition = competition,
            year = year,
            query_parameters = query_parameters,
            results = results
        ),
        class = "cfg_leaderboard"
    )
}
