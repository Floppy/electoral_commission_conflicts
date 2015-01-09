require 'similar_text'
require 'levenshtein'
require 'yaml'
require 'csv'

parties = CSV.parse(File.read('UK-Political-Parties/data/parties.csv'), headers: true)
names = parties.map{|x| x['Entity name']}

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
        csv << [
          name,
          comparison,
          name.similar(comparison),
          Levenshtein.distance(name,comparison)
        ]
      end
    end
  end
    
end