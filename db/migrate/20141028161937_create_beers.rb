class CreateBeers < ActiveRecord::Migration
  def change
    create_table :beers do |t|
      t.string :beer_name
      t.string :brewery
      t.string :style
      t.float :abv
      t.string :glassware
      t.string :location

      t.timestamps
    end
  end
end
