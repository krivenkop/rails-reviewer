class CreateReviews < ActiveRecord::Migration[6.0]
  def change
    create_table :reviews do |t|
      t.string :title
      t.text :text
      t.references :author, index: true, foreign_key: { to_table: :users }
      t.references :country_from, index: true, foreign_key: { to_table: :countries }
      t.references :country_to, index: true, foreign_key: { to_table: :countries }
      t.string :city_from
      t.string :city_to
      t.references :carrier, index: true, foreign_key: { to_table: :carriers }
      t.integer :rating, unsigned: true

      t.timestamps

    end
  end
end
