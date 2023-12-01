# LEGO Franchise

## 

## README.md

Overview

The purpose of the project is to analyze the relationships between media franchises and LEGO sets that were produced in association with those franchises. A media franchise is a collection of related media, like movies. The Star Wars series is an example of a movie media franchise. The LEGO company produced a number of sets based on Star Wars characters, places and individual movies within the franchise.

### 1. Software and Platform

-   Software (R, RStudio, Git)
-   Packages (httr2, tidyverse, rvest, tibble, readr, dplyr)
-   Platform (macOS 12.0.1)

### 2. Documentation Map

-   project/

    -   README.md

    -   example_analysis.qmd

    -   data/

        -   imported_data/

            -   franchise.csv

            -   all_sets.rds

            -   themes.rds

            -   metadata/

                -   source.txt

        -   cleaned_data/

            -   lego_franchise.csv

            -   metadata/

                -   source.txt

                -   codebook.txt

    -   scripts/

        -   import.qmd

        -   cleaning.qmd

        -   exploration.qmd

    -   output/

        -   final_data.csv

### 3. Instructions for reproducing your work

The data were collected from online sources using web scraping and online APIs. That data was imported into R (with script import.qmd) and cleaned (cleaning.qmd). The cleaned data was combined and written to the file final_data.csv. The cleaned data was then analyzed (using exploration.qmd)

#### Data import:

Web scraping: Data on popular media franchises is available from Wikipedia: <https://en.wikipedia.org/wiki/List_of_highest-grossing_media_franchises>

To scrape this site, use import.qmd. The following packages are required: httr2, tidyverse, rvest, tibble, readr

The relevant columns are imported one-by-one, then combined and cleaned.

APIs: Data on LEGO sets is available from rebrickable.com. Make two GET requests since there was no data frame on rebrickable that contains both set and theme data.Join the set data to themes using the theme_id column.

#### Data cleaning:

Franchise data: The file cleaning.qmd removes entries that are not true franchises formats columns correctly (removing unwanted characters etc.) rectangles the data to convert it to a dataframe called "franchise"

The dataframe "franchise" has 121 rows (franchises) and 4 variables.

LEGO data:

After importing our sets/themes data from API and franchise data from web scraping, we joined the two datasets together for our final dataset. First, we had to combine common LEGO set themes together. For example, "The Simpsons Series 1" and "The Simpsons Series 2" were combined into a common theme labeled "The Simpsons". Next, we changed the themes in the franchise data to match similar names to the LEGO set data. Lastly, we were able to join the two data sets together by the themes column. This final dataset, lego_franchise_csv, contains information about LEGO sets including the release year and the number of parts as well as information on the associated media franchise with inception date, original medium, and total revenue.

The merged file has 2,562 rows and 7 variables, and is written out to final_data.csv.

#### Exploration:

The file exploration.qmd addresses the following 6 questions:

1.  How many LEGO sets are there for each media franchise?
2.  In which year were the most LEGO sets released, and in that year, which franchise released the most sets?
3.  In the last 5 years, which franchise released the most LEGO sets?
4.  Is the average number of LEGO sets higher for movie or non-movie franchises?
5.  Are franchises that are higher-grossing associated with more LEGO sets?
6.  Is the answer to #5 different for movie franchises than non-movie franchises?
