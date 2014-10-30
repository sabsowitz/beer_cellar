class Beer < ActiveRecord::Base
belongs_to :cellar

  def self.party(beer_name)

    beer_for_api_call = beer_name.gsub(" ", "+")
    beer_url = "http://api.brewerydb.com/v2/search?q=#{beer_for_api_call}&type=beer&results=10&key=4938dd57b16650c7920500ed375f44e5"
    response = HTTParty.get(beer_url)
    
  end
end
