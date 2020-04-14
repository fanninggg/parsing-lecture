require 'csv'

filepath    = 'data/beers.csv'

# ===========
# Parsing CSV
# ===========
csv_options = { col_sep: ',', quote_char: '"', headers: :first_row }

CSV.foreach(filepath, csv_options) do |row|
  # row is a CSV Row which acts like a hash
  p row["Name"]
end

# ===========
# Storing CSV
# ===========
csv_options = { col_sep: ',', force_quotes: true, quote_char: '"' }

beers = [
  {name: "Asahi", appearance: "Lager", origin: "Japan"},
  {name: "Guiness", appearance: "Stout", origin: "Ireland"},
  {name: "Peroni", appearance: "Lager", origin: "Italy"}

]

CSV.open(filepath, 'wb', csv_options) do |csv|
  csv << ['Name', 'Appearance', 'Origin']
  beers.each do |beer|
    csv << [beer[:name], beer[:appearance], beer[:origin]]
  end
end

# 'wb' => write binary
# 'r' => read
# 'a' => append
