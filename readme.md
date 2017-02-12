---
title: "Getting Cleaning Data Project"
author: "Alex"
date: "12 Februar 2017"
output: html_document
---

This readme describes the run_analysis.R script which is part of the Getting and Cleaning Data Course.

The goal was to download a data set, combine it, only keep the mean and standard deviation values. The output is a tidy data set.

* Donwload data
* Merge test and training data
* Subset data to keep mean and standard deviation fields
* Cross reference activity data to map the activity names
* Cross reference subject data
* Create a second independet tidy data set with average of each variable for each activity and each subject

Output is a text file tidyOut.txt