This repository lists all Electoral Commission party name rejections since November 27th, 2012, obtained under FOI.

`parties.yml` is the source data, and it's analysed for similarity by `similarity.rb` using the `similar_text` ruby gem.

The results are in `similarity.csv`. Lower numbers are less similar, 100 means the strings are identical.