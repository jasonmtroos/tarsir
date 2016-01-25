# http://statline.cbs.nl/Statweb/publication/?DM=SLEN&PA=60029eng&D1=0-2%2c6%2c9-10%2c12-16%2c20-23%2c30-55&D2=0-2&D3=a&LA=EN&HDR=G2&STB=T%2cG1&VW=D

library(readr)
library(dplyr)
library(tidyr)

read_csv2( './data-raw/Leisure_activities_250116120037.csv', skip = 1 ) %>% 
  tbl_df %>%
  filter( row_number() != nrow(.) ) %>%
  gather( year, share, -starts_with('Subjects'), -starts_with('Personal'), -Periods ) %>%
  select( -Periods ) ->
  leisure_activities
devtools::use_data(leisure_activities)
  
  
