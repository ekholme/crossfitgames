
<!-- README.md is generated from README.Rmd. Please edit that file -->

# crossfitgames

<!-- badges: start -->

![GitHub last
commit](https://img.shields.io/github/last-commit/ekholme/crossfitgames)
[![R-CMD-check](https://github.com/ekholme/crossfitgames/actions/workflows/R-CMD-check.yaml/badge.svg)](https://github.com/ekholme/crossfitgames/actions/workflows/R-CMD-check.yaml)
<!-- badges: end -->

`{crossfitgames}` provides high-level functionality for retrieving data
from the Crossfit Games API. It’s still a work-in-progress, but the
basic functionality is there to get data from the Games. I’ll ge adding
functionality to retrieve data from other competitions as well as
functions to manipulate data from request results.

It is loosely inspired by [Davis Vaughan’s {crossfit}
package](https://github.com/DavisVaughan/crossfit), which also provides
functionality for retrieving data from the Crossfit API.

## Installation

You can install the development version of crossfitgames from github
with:

``` r
# install.packages("devtools")
devtools::install_github("ekholme/crossfitgames")
```

## Example

You might want to get final results from the Crossfit games in a given
year. For example, you can get the data from the 2022 games for the
women’s division via the `games_leaderboard()` function.

``` r
library(crossfitgames)
#> Warning: replacing previous import 'tibble::data_frame' by 'vctrs::data_frame'
#> when loading 'crossfitgames'

women_22 <- games_leaderboard(2022, "women")
```

This will return a `cfg_leaderboard` S3 object. You can use methods
associated with this object to extract more usable data:

``` r
# will get the final leaderboard
final_lb <- extract_final_leaderboard(women_22)

head(final_lb)
#> # A tibble: 6 × 3
#>    rank athlete          score
#>   <dbl> <chr>            <dbl>
#> 1     1 Tia-Clair Toomey  1158
#> 2     2 Mallory O'Brien   1045
#> 3     3 Laura Horvath      981
#> 4     4 Danielle Brandon   937
#> 5     5 Brooke Wells       904
#> 6     6 Emma Lawson        893
```

``` r
# will get event results for each athlete
event_results <- extract_workout_results(women_22)

head(event_results)
#> # A tibble: 6 × 5
#>   athlete          workout_num workout_place points score   
#>   <chr>                  <int>         <dbl>  <dbl> <chr>   
#> 1 Tia-Clair Toomey           1             2     97 38:26.64
#> 2 Tia-Clair Toomey           2             2     97 07:08.14
#> 3 Tia-Clair Toomey           3             1    100 18 rep  
#> 4 Tia-Clair Toomey           4            23     36 23 pt   
#> 5 Tia-Clair Toomey           5             9     76 11:22.64
#> 6 Tia-Clair Toomey           6             3     94 35:11.29
```
