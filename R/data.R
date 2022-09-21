#' Constants to help build queries
#' 
#' @description
#' A subset of the (probably) most useful constants to use to help build queries. Note that this isn't an exhaustive list, but the API isn't well-documented, so it's not straightforward to get everything.
#' 
#' - `cfg_competitions`: values accepted as competition parameters.
#' 
#' - `cfg_divisions`: values accepted as division parameters. Note that this doesn't currently include any teen, masters, or adaptive competitions.
#' 
#' - `cfg_scaled`: values accepted as scaled parameters.
#' 
#' - `cfg_semis`: semi-final competitions. Currently only includes the semifinal competitions from the 2022 season.
#' 
#' - `cfg_regions`: values accepted as region parameters.
#' 
#' @name lookups
NULL


#' @rdname lookups
#' @export
cfg_competitions <- list(
    open = "open",
    quarterfinals_indiv = "quarterfinalsindividual",
    semifinals = "semifinals",
    games = "games"
)

#' @rdname lookups
#' @export
cfg_divisions <- list(
    men = 1L,
    women = 2L,
    teams = 11L
)

#' @rdname lookups
#' @export
cfg_scaled <- list(
    rx = 0L,
    scaled = 1L,
    foundations = 2L
)

#' @rdname lookups
#' @export
cfg_semis <- list(
    lcq = 209L,
    copa_sur = 206L,
    strength_in_depth = 205L,
    atlas_games = 204L,
    granite_games = 203L,
    far_east = 202L,
    cape_town = 199L,
    macc = 198L,
    torian = 197L,
    lowlands = 196L,
    syndicate_crown = 195L
)

#' @rdname lookups
#' @export
cfg_regions <- list(
    worldwide = 0L,
    africa = 30L,
    asia = 28L,
    europe = 29L,
    north_america = 31L,
    oceania = 32L,
    south_america = 33L
)

#' @keywords internal
all_data <- list(
    competition = cfg_competitions,
    division = cfg_divisions,
    region = cfg_regions,
    scaled = cfg_scaled,
    semifinal = cfg_semis
)