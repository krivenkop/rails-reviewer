class CreateCountries < ActiveRecord::Migration[6.0]
  def change
    create_table :countries do |t|
      t.string :name
      t.string :alpha_three_code

      t.timestamps
    end
  end
end
