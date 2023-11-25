# Exploration

# Question 1:
# How many sets are there for each media franchise?
most_sets <- lego_franchise |>
  group_by(media_franchise) |>
  summarise(count = n()) |>
  arrange(desc(count))

# Question 2:
# Which year was the most sets released?
sets_in_year <- lego_franchise |>
  group_by(release_year) |>
  summarise(count = n()) |>
  arrange(desc(release_year))

# plot to show the amount of sets released each year
ggplot(lego_franchise) +
  geom_bar(aes(x = release_year)) +
  labs(x = "Release Year", y = "Sets", title = "Amount of Sets Released Per Year")

# Which franchise released the most sets in 2021 (the year in which the most sets were released)?
sets_21 <- lego_franchise |>
  filter(release_year == 2021) |>
  group_by(media_franchise) |>
  summarise(count = n()) |>
  arrange(desc(count))

# Question 3
# Which franchise is on the rise? In the last 5 years, which franchise released the most lego sets?
last_five_yrs <- lego_franchise |>
  filter(release_year >= 2019 & release_year < 2024) |>
  arrange(desc(release_year)) |>
  group_by(media_franchise) |>
  summarise(count= n()) |>
  arrange(desc(count))
