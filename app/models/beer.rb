class Beer < ActiveRecord::Base

  def self.party(beer_name)
    beer_name ||= "stone"

    beer_for_api_call = beer_name.gsub(" ", "+")

    # auth = { query: { key: '4938dd57b16650c7920500ed375f44e5'} }
    beer_url = "http://api.brewerydb.com/v2/search?q=#{beer_for_api_call}&type=beer&results=10&key=4938dd57b16650c7920500ed375f44e5"
    response = HTTParty.get(beer_url)
    
    # beer_data = response["data"]
    # beer_name = response["data"][1]["name"]
    # beer_name= beer_data[0]["name"]
    # beer_style = beer_data[0]["description"]




    # response.each do |attribute|
    #   attribute["data"]["name"]
    # end
  end
end
