class Beer < ActiveRecord::Base

  def self.party(beer_name)
    beer_name ||= "stone"

    # auth = { query: { key: '4938dd57b16650c7920500ed375f44e5'} }
    beer_url = "http://api.brewerydb.com/v2/search?q=#{beer_name}&type=beer&results=10&key=4938dd57b16650c7920500ed375f44e5"
    response = HTTParty.get beer_url
  end
end