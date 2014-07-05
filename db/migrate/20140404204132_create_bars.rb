class CreateBars < ActiveRecord::Migration
  def change
    create_table :bars do |t|
      t.string :name
      t.float :price
      t.float :latitude
      t.float :longitude
      t.string :address
      t.time :start_happy
      t.time :end_happy
      t.float :price_happy

      t.timestamps
    end
  end
end
