# load in packages
library(httr2)
library(tidyverse)
library(rvest)
library(dplyr)

# apikey for get request
apikey <- 'd69ba9977714c17a26976fd51971f94b'


# obtain data on lego themes
base_url <- 'https://rebrickable.com' # base url for rebrickable
request(base_url) |>
  req_url_path_append('api/v3/lego/themes') |>
  req_url_query(key = 'd69ba9977714c17a26976fd51971f94b', page_size = 1000) |>
  # return first 1000 results
  req_perform() |>
  resp_body_json() -> themes

# convert themes to a tibble in order to rectangle
themes_rec <- tibble(json = themes)

# rectangle themes_rec
themes_rec_a <- themes_rec |>
  slice(4) |>
  unnest_longer(json) |>
  unnest_wider(json)



# obtain data on lego sets
# the data consists of 1000 results for 22 pages
# instead of using a loop, I requested data from each page separately then combined the pages for the lego sets data of all 22 pages
# I chose to do this the long way (without a loop) because I ran into less issues

# page 1
request(base_url) |>
  req_url_path_append('api/v3/lego/sets') |>
  req_url_query(key = 'd69ba9977714c17a26976fd51971f94b', page_size = 1000, page = 1) |>
  req_perform() |>
  resp_body_json() -> sets1

# page 2

request(base_url) |>
  req_url_path_append('api/v3/lego/sets') |>
  req_url_query(key = 'd69ba9977714c17a26976fd51971f94b', page_size = 1000, page = 2) |>
  req_perform() |>
  resp_body_json() -> sets2

# page 3

request(base_url) |>
  req_url_path_append('api/v3/lego/sets') |>
  req_url_query(key = 'd69ba9977714c17a26976fd51971f94b', page_size = 1000, page = 3) |>
  req_perform() |>
  resp_body_json() -> sets3

# page 4

request(base_url) |>
  req_url_path_append('api/v3/lego/sets') |>
  req_url_query(key = 'd69ba9977714c17a26976fd51971f94b', page_size = 1000, page = 4) |>
  req_perform() |>
  resp_body_json() -> sets4

# page 5

request(base_url) |>
  req_url_path_append('api/v3/lego/sets') |>
  req_url_query(key = 'd69ba9977714c17a26976fd51971f94b', page_size = 1000, page = 5) |>
  req_perform() |>
  resp_body_json() -> sets5

# page 6

request(base_url) |>
  req_url_path_append('api/v3/lego/sets') |>
  req_url_query(key = 'd69ba9977714c17a26976fd51971f94b', page_size = 1000, page = 6) |>
  req_perform() |>
  resp_body_json() -> sets6

# page 7

request(base_url) |>
  req_url_path_append('api/v3/lego/sets') |>
  req_url_query(key = 'd69ba9977714c17a26976fd51971f94b', page_size = 1000, page = 7) |>
  req_perform() |>
  resp_body_json() -> sets7

# page 8 

request(base_url) |>
  req_url_path_append('api/v3/lego/sets') |>
  req_url_query(key = 'd69ba9977714c17a26976fd51971f94b', page_size = 1000, page = 8) |>
  req_perform() |>
  resp_body_json() -> sets8

# page 9

request(base_url) |>
  req_url_path_append('api/v3/lego/sets') |>
  req_url_query(key = 'd69ba9977714c17a26976fd51971f94b', page_size = 1000, page = 9) |>
  req_perform() |>
  resp_body_json() -> sets9

# page 10

request(base_url) |>
  req_url_path_append('api/v3/lego/sets') |>
  req_url_query(key = 'd69ba9977714c17a26976fd51971f94b', page_size = 1000, page = 10) |>
  req_perform() |>
  resp_body_json() -> sets10

# page 11

request(base_url) |>
  req_url_path_append('api/v3/lego/sets') |>
  req_url_query(key = 'd69ba9977714c17a26976fd51971f94b', page_size = 1000, page = 11) |>
  req_perform() |>
  resp_body_json() -> sets11

# page 12

request(base_url) |>
  req_url_path_append('api/v3/lego/sets') |>
  req_url_query(key = 'd69ba9977714c17a26976fd51971f94b', page_size = 1000, page = 12) |>
  req_perform() |>
  resp_body_json() -> sets12

# page 13

request(base_url) |>
  req_url_path_append('api/v3/lego/sets') |>
  req_url_query(key = 'd69ba9977714c17a26976fd51971f94b', page_size = 1000, page = 13) |>
  req_perform() |>
  resp_body_json() -> sets13

# page 14

request(base_url) |>
  req_url_path_append('api/v3/lego/sets') |>
  req_url_query(key = 'd69ba9977714c17a26976fd51971f94b', page_size = 1000, page = 14) |>
  req_perform() |>
  resp_body_json() -> sets14

# page 15

request(base_url) |>
  req_url_path_append('api/v3/lego/sets') |>
  req_url_query(key = 'd69ba9977714c17a26976fd51971f94b', page_size = 1000, page = 15) |>
  req_perform() |>
  resp_body_json() -> sets15

# page 16

request(base_url) |>
  req_url_path_append('api/v3/lego/sets') |>
  req_url_query(key = 'd69ba9977714c17a26976fd51971f94b', page_size = 1000, page = 16) |>
  req_perform() |>
  resp_body_json() -> sets16

# page 17

request(base_url) |>
  req_url_path_append('api/v3/lego/sets') |>
  req_url_query(key = 'd69ba9977714c17a26976fd51971f94b', page_size = 1000, page = 17) |>
  req_perform() |>
  resp_body_json() -> sets17

# page 18

request(base_url) |>
  req_url_path_append('api/v3/lego/sets') |>
  req_url_query(key = 'd69ba9977714c17a26976fd51971f94b', page_size = 1000, page = 18) |>
  req_perform() |>
  resp_body_json() -> sets18

# page 19

request(base_url) |>
  req_url_path_append('api/v3/lego/sets') |>
  req_url_query(key = 'd69ba9977714c17a26976fd51971f94b', page_size = 1000, page = 19) |>
  req_perform() |>
  resp_body_json() -> sets19

# page 20

request(base_url) |>
  req_url_path_append('api/v3/lego/sets') |>
  req_url_query(key = 'd69ba9977714c17a26976fd51971f94b', page_size = 1000, page = 20) |>
  req_perform() |>
  resp_body_json() -> sets20

# page 21

request(base_url) |>
  req_url_path_append('api/v3/lego/sets') |>
  req_url_query(key = 'd69ba9977714c17a26976fd51971f94b', page_size = 1000, page = 21) |>
  req_perform() |>
  resp_body_json() -> sets21

# page 22

request(base_url) |>
  req_url_path_append('api/v3/lego/sets') |>
  req_url_query(key = 'd69ba9977714c17a26976fd51971f94b', page_size = 1000, page = 22) |>
  req_perform() |>
  resp_body_json() -> sets22

# here I combine all 22 pages to all_sets
all_sets <- list(sets1[["results"]],
                  sets2[["results"]],
                  sets3[["results"]],
                  sets4[["results"]],
                  sets5[["results"]],
                  sets6[["results"]],
                  sets7[["results"]],
                  sets8[["results"]],
                  sets9[["results"]],
                  sets10[["results"]],
                  sets11[["results"]],
                  sets12[["results"]],
                  sets13[["results"]],
                  sets14[["results"]],
                  sets15[["results"]],
                  sets16[["results"]],
                  sets17[["results"]],
                  sets18[["results"]],
                  sets19[["results"]],
                  sets20[["results"]],
                  sets21[["results"]],
                  sets22[["results"]])

# convert all_sets to a tibble
sets_rec <- tibble(json = all_sets)

# rectangle sets_rec
sets_rec_a <- sets_rec |>
  unnest_longer(json) |>
  unnest_wider(json)


# comine themes_rec_a to sets_rec_a by joining the id column in themes_rec_a to the theme_id column in sets_rec_a
lego_data <- sets_rec_a |>
  left_join(y = themes_rec_a, by = join_by(theme_id == id)) |>
  rename(sets = name.x) |>
  rename(themes = name.y) |>
  select(!(set_img_url:last_modified_dt) & !(set_num))
