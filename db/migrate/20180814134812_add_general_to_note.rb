class AddGeneralToNote < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :general, :boolean, null: false, default: false
  end
end
