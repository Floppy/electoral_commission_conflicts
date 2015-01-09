require 'similar_text'
require 'levenshtein'
require 'yaml'
require 'csv'

parties = YAML.load_file('rejections.yml')

# Process similarity of rejections

CSV.open("rejections.csv", "wb") do |csv|

  csv << [
    "Rejected name",
    "Conflicting name or description",
    "Conclicting party if description",
    "similar_text score (%)",
    "Levenshtein distance"
  ]

  parties.each_pair do |name, conflict_data|
    csv << [
      name,
      conflict_data["conflict"],
      conflict_data["conflicting_party"],
      name.similar(conflict_data["conflict"]),
      Levenshtein.distance(name,conflict_data["conflict"])
    ]
  end
    
end