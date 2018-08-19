class AddProfileToNote < ActiveRecord::Migration[5.1]
  def change
    add_column :notes, :profile_sex, :string, default: nil
    add_column :notes, :profile_age, :string, default: nil
    add_column :notes, :profile_type, :string, default: nil
    add_column :notes, :profile_supplement, :text, default: nil
  end
end
