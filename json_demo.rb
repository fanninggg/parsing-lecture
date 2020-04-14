require 'json'

filepath    = 'data/beers.json'

# ===========
# Parsing CSV
# ===========
serialized_beers = File.read(filepath)
beers_hash = JSON.parse(serialized_beers)

origins = []
beers_hash['beers'].each do |beer|
  origins << beer['origin']
end
p origins.uniq

# ===========
# Storing CSV
# ===========
beers = { beers: [
  {
    name:       'Edelweiss',
    appearance: 'White',
    origin:     'Austria'
  },
  {
    name:       'Guinness',
    appearance: 'Stout',
    origin:     'Ireland'
  },
]}

File.open(filepath, 'wb') do |file|
  file.write(JSON.generate(beers))
end
