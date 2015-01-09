This repository lists all Electoral Commission party name rejections since November 27th, 2012, obtained under FOI.

`parties.yml` is the source data, and it's analysed for similarity by `similarity.rb` using the `similar_text` and `levenshtein` ruby gems.

The results are in `similarity.csv`. 

For `similar_text`, lower numbers are less similar, 100 means the strings are identical. For `levenshtein` higher numbers are less similar, although this isn't a very good measure as the strings compared are different lengths.