class Beer < ActiveRecord::Base
  belongs_to :cellar

  def self.search_by_beer(beer_name)
    beer_for_api_call = beer_name.gsub(" ", "+")
    beer_url = "http://api.brewerydb.com/v2/search?q=#{beer_for_api_call}&type=beer&results=10&key=acc97bf6059115e8ed1c376fb63f1427"
    response = HTTParty.get(beer_url)
    
  end

  def self.search_by_brewery(brewery_name)
    brewery_for_api_call = brewery_name.gsub(" ", "+")
    brewery_url = "http://api.brewerydb.com/v2/search?q=#{brewery_for_api_call}&type=brewery&results=10&key=acc97bf6059115e8ed1c376fb63f1427"
    response = HTTParty.get(brewery_url)
  end
end
