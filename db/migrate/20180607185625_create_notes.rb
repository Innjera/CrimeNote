class CreateNotes < ActiveRecord::Migration[5.1]
  def change
    create_table :notes do |t|
      t.float :latitude
      t.float :longitude
      t.string :address, null: false
      t.string :address_city_part, null: false
      t.string :address_country_part, null: false, default: "South Africa"
      t.text :situation, null: false
      t.datetime :occured_at, null: false
      t.string :crime_category, null: false

      t.timestamps
    end
  end
end
