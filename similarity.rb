require 'similar_text'
require 'yaml'
require 'csv'

parties = YAML.load_file('parties.yml')

CSV.open("similarity.csv", "wb") do |csv|

  parties.each_pair do |name, conflict_data|
    csv << [
      name,
      conflict_data["conflict"],
      conflict_data["conflicting_party"],
      name.similar(conflict_data["conflict"])
    ]
  end
    
end