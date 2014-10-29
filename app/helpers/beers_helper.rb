module BeersHelper
  def name(beer)
    beer["name"]
  end

  def abv(beer)
    beer["abv"]
  end

  def ibu(beer)
    beer["ibu"]
  end

  def description(beer)
    beer["description"] ? beer["description"] : "N/A"
  end

  def when_available(beer)
    beer["available"] ? beer["available"]["name"] : "N/A"
  end

  def glass_type(beer)
    beer["glass"] ? beer["glass"]["name"] : "N/A"
  end

  def label(beer)
    beer["labels"] ? (image_tag beer["labels"]["medium"]) : " "
  end

  def style(beer)
    beer["style"] ? beer["style"]["name"] : "N/A"
  end

  def style_description(beer)
    beer["style"] ? beer["style"]["description"] : " "
  end
end
