#' Core Get Response
#' 
#' 

make_request <- function(comp, year, ...) {
    base_url <- "https://c3po.crossfit.com/api/competitions/v2/competitions/"

    comp <- as.character(comp)

    year <- as.integer(year)

    # checking size
    vec_assert(comp, size = 1L)
    vec_assert(year, size = 1L)

    # adding in request parameters
    params <- list(...)
    
    req <- request(base_url)

    #RESUME HERE

}