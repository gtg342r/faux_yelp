class CreateTags < ActiveRecord::Migration
  def change
    create_table :tags do |t|
      t.string :tag_name
      t.integer :restaurant_id

      t.timestamps

    end
  end
end
