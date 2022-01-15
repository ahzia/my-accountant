class CreateJoins < ActiveRecord::Migration[7.0]
  def change
    create_table :joins do |t|
      t.references :catagories, null: false, foreign_key: true
      t.references :items, null: false, foreign_key: true

      t.timestamps
    end
  end
end
