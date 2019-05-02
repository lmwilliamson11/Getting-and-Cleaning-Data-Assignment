# README

This repo contains the files for the Getting and Cleaning Data course assignment

## Content
* `run_analysis.R` - Merges the train and test data from <http://archive.ics.uci.edu/ml/datasets/Human+Activity+Recognition+Using+Smartphones> and generates a tidy dataset
* `Codebook.md` - Description of analysis, dataset and variables

## How it works
* Install the `dplyr` packages using `install.packages("dplyr")` if you do not have it already installed.
* Run the analysis by running `source("run_analysis.R")`
 * Downloads the Human Activity data from Smartphones data
 * Generates a tidy dataset of average measurements for each participant across the 6 different activities called                                      `tidy_mean_summary_table.txt` 
        
