#creating classes for CFG requests to use in helper functions
#will be helpful to refine properties later
cfg <- R7::new_class(
    name = "cfg",
    package = "crossfitgames",
    properties = list(
        results = class_list
    )
)