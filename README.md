This repository lists all Electoral Commission party name rejections since November 27th, 2012, obtained under FOI.

## Rejections

`rejections.yml` is the source data, and it's analysed for similarity by `rejections.rb` using the `similar_text` and `levenshtein` ruby gems.

The results are in `rejections.csv`. 

For `similar_text`, lower numbers are less similar, 100 means the strings are identical. For `levenshtein` higher numbers are less similar, although this isn't a very good measure as the strings compared are different lengths.

## Registered parties

For comparison, `registered.csv` contains the same analysis across all pairs of registered parties, using the data from https://github.com/DemocracyClub/UK-Political-Parties