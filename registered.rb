require 'similar_text'
require 'levenshtein'
require 'yaml'
require 'csv'

parties = CSV.parse(File.read('UK-Political-Parties/data/parties.csv'), headers: true)
names = parties.map{|x| x["Entity type"] == "Political Party" ? x['Entity name'] : nil}.compact

# Process similarity of names

CSV.open("registered.csv", "wb") do |csv|

  csv << [
    "Name",
    "Compared name",
    "similar_text score (%)",
    "Levenshtein distance"
  ]

  names.each do |name|
    names.each do |comparison|
      if name != comparison
        a = name.gsub("Party", "").gsub("The", "")
        b = comparison.gsub("Party", "").gsub("The", "")
        csv << [
          a,
          b,
          a.similar(b),
          Levenshtein.distance(a,b)
        ]
      end
    end
  end
    
end