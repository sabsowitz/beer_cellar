class AddCellarIdToBeers < ActiveRecord::Migration
  def change
    add_column :beers, :cellar_id, :integer
  end
end
