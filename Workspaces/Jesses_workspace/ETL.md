# Star Sharks ETL Report
Rebecca Blackham
Valor Israel
Jesse Noss

## Introduction
As our final project, our team sought to investigate global fishing trends, namely the production and consumption of fish and fish products by countries around the world. 

[finish introduction - what are we doing what are we studying]

## Data Sources
The data we used to supplement this investigation was extracted from various sources. 

[add other datasets]

To add continent labels by country, we used a [Country & Area Dataset](https://www.kaggle.com/datasets/lukexun/country-area-continent-region-codes)<sup>2</sup> from [Kaggle](https://www.kaggle.com/). 


## Extraction and Transformation
Our steps in processing the data were initially conducted through VSCode python notebooks, where we cleaned up the datasets and ensured that they worked as we expected. We then recreated the process in Azure Databricks, also adding on steps to produce and consume Kafka messages, and finally deliver our data into an SQL database for querying and storage.

To begin this process, we gathered together the necessary csv files which were previously downloaded from the sources outlined in the [Data Sources](##-Data-Sources) section. These csv files were then read into their own pandas dataframes in python, from which point we could start cleaning them up and joining them together.

[add transformation process]

[maybe add images showing the process? or better, links to notebooks]

## References
[finish adding citations to datasets]

X, Luke. “Country &amp; Area Dataset.” Kaggle, May 23, 2022. https://www.kaggle.com/datasets/lukexun/country-area-continent-region-codes. 