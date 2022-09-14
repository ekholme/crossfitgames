#creating classes for CFG requests to use in helper functions
#will be helpful to refine properties later
cfg_leaderboard <- R7::new_class(
    name = "cfg_leaderboard",
    package = "crossfitgames",
    properties = list(
        competition = R7::class_character,
        year = R7::class_integer,
        query_parameters = R7::class_list,
        results = R7::class_list
    )
)