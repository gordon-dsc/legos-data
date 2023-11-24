# Combining API and Web Scraping Data


# combine common themes together
lego_data <- lego_data_a |>
  mutate(themes = if_else(themes == "The Simpsons Series 1" | themes == "The Simpsons Series 2", "The Simpsons", themes)) |>
  mutate(themes = if_else(themes == "Marvel Series 1" | themes == "Marvel Series 2" | themes == "Marvel Super Heroes" | themes == "Super Heroes Marvel", "Marvel", themes)) |>
  mutate(themes = if_else(themes == "The LEGO Batman Movie" | themes == "The LEGO Batman Movie Series 1" | themes == "The LEGO Batman Movie Series 2", "Batman", themes)) |>
  mutate(themes = if_else(themes == "Justice League" | themes == "DC Super Heroes" | themes == "Superman", "DC Comics", themes))


# create a new column in the franchise data with the corresponding theme to the lego data
# if the franchise data doesn't have a corresponding theme, then its given an NA
franchise_a <- franchise$themes <- c(NA, "Disney's Mickey Mouse", "Winnie the Pooh", "Star Wars", "Disney Princess", NA, "Harry Potter", NA, "Marvel", NA, "Batman", NA, "Spider-Man", NA, NA, "Cars", NA, "Teenage Mutant Ninja Turtles", "Looney Tunes", "Dora the Explorer", NA, NA, "Toy Story", NA, NA, NA, "Avengers", "Frozen", NA, "SpongeBob SquarePants", "Minions", NA, NA, NA, NA, NA, NA, "Angry Birds", "Thomas & Friends", "Jurassic World", NA, NA, "Super Mario", NA, "Pirates of the Caribbean", "Ben 10", "DC Comics", "The Muppets", NA, NA, NA, "X-Men", NA, "The Lord of the Rings", NA, NA, NA, NA, "Avatar", "Sonic The Hedgehog", NA, NA, NA, NA, NA, "Bob the Builder", NA, "The Simpsons", "Scooby-Doo", NA, NA, NA, NA, "Minecraft", NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, "Iron Man", NA, NA, "Indiana Jones", NA, NA, "The Powerpuff Girls", NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, NA, "Guardians of the Galaxy", NA, NA, NA, NA, NA, NA, NA, NA, NA, "Ghostbusters", NA, NA, NA)


# select every column except the title column and get rid of the rows (media franchises) that don't have a lego theme
franchise <- franchise |>
  select(themes, year, original_medium, revenue) |>
  na.omit()


# join the lego set data to the media franchise data by joining the themes column from both data frames
# remove parent_id and get rid of all observations that contain an NA as this will only give us lego sets that correspond to the media franchises
# also remove theme id because it means the same as the themes column which is now renamed as media_franchise
lego_franchise <- lego_data |>
  left_join(y = franchise, by = join_by(themes == themes)) |>
  rename(release_year = year.x,
         inception = year.y,
         media_franchise = themes) |>
  select(!(parent_id) & !(theme_id)) |>
  na.omit()
