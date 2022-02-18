#!/bin/bash

### 1 - Convert External url on "Read more on Txxxx" external url
while IFS="," read -r EXTERNAL_URL EXTERNAL_URL_READMORE
    do
        sed -i "s,$EXTERNAL_URL,$EXTERNAL_URL_READMORE,g" *.md
    done < 1-ExternalToExternalReadMore.csv

### 2 - Convert External url to internal obsidian url
while IFS="," read -r EXTERNAL_URL INTERNAL_URL
    do
        sed -i "s,$EXTERNAL_URL,$INTERNAL_URL,g" *.md
    done < 2-ExternalToInternalLink.csv

### 3 - Convert footnotes formating to link external ex: [[1]] to [1]
while IFS="," read -r DOUBLE_BRACKET SINGLE_BRACKET
    do
        sed -i "s,$DOUBLE_BRACKET,$SINGLE_BRACKET,g" *.md
    done < 3-DoubleBracketToSingle.csv