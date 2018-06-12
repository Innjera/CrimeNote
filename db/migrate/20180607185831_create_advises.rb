class CreateAdvises < ActiveRecord::Migration[5.1]
  def change
    create_table :advises do |t|
      t.references :note, null: false
      t.string :user_name
      t.text :body, null: false

      t.timestamps
    end
  end
end
