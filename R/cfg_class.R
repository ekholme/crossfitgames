#creating classes for CFG requests to use in helper functions
#will be helpful to refine properties later
cfg <- R7::new_class(
    name = "cfg",
    package = "crossfitgames",
    properties = list(
        competition = class_character,
        year = class_integer,
        results = class_list
    )
)