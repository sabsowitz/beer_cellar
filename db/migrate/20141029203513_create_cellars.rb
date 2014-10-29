class CreateCellars < ActiveRecord::Migration
  def change
    create_table :cellars do |t|
      t.string :title
      t.integer :user_id

      t.timestamps
    end
  end
end
