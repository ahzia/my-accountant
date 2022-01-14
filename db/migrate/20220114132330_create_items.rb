class CreateItems < ActiveRecord::Migration[7.0]
  def change
    create_table :items do |t|
      t.text :name
      t.text :amount

      t.timestamps
    end
  end
end
