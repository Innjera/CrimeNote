class AddEmbassyUrlToNote < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :embassy, :boolean, null: false, default: false
    add_column :notes, :source_url, :text
  end
end
