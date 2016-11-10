class CreateRestaurants < ActiveRecord::Migration
  def change
    create_table :restaurants do |t|
      t.string :name
      t.string :city
      t.string :neighborhood
      t.text :description
      t.string :address
      t.string :website
      t.string :cover_photo

      t.timestamps

    end
  end
end
