
# WHAT IS THIS FILE? ------------------------------------------------------

# This file sources and runs the scripts that load raw data, clean it for
# analysis, and then produce key analysis outputs


# LOAD PACKAGES -----------------------------------------------------------

pacman::p_load(
  "tidyverse",
  #"qualtRics",
  "qualtr",
  "salesforcer",
  "glue",
  "tidytext",
  "lubridate"
)


register_options()

# SOURCE SCRIPTS ----------------------------------------------------------

source("Z:/FSC Pilot - CCDF/Analysis/rct-analysis/R/pipeline/utils.R")
source("Z:/FSC Pilot - CCDF/Analysis/rct-analysis/R/pipeline/load-data.R")
source("Z:/FSC Pilot - CCDF/Analysis/rct-analysis/R/pipeline/clean-data.R")

source("Z:/FSC Pilot - CCDF/Analysis/rct-analysis/R/pipeline/rct_prep.R")

# RUN PIPELINE ------------------------------------------------------------

dat_raw <- load_data(use_cache = TRUE) # sometimes first time running script returns an error for some reason that I cannot pinpoint.... 
                                      # try running twice

dat_clean <- clean_data(dat_raw, use_cache = FALSE)

dat_rct_prep <- rct_prep(dat_clean, use_cache = FALSE)
