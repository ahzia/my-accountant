class CreateCatagories < ActiveRecord::Migration[7.0]
  def change
    create_table :catagories do |t|
      t.text :name
      t.text :icon

      t.timestamps
    end
  end
end
