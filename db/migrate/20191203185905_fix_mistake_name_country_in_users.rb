class FixMistakeNameCountryInUsers < ActiveRecord::Migration[6.0]
  def change
    rename_column :users, :counrty, :country
  end
end
