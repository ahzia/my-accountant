class ChangeColumnTypeInItems < ActiveRecord::Migration[7.0]
  def change
    remove_column :items, :amount
    add_column :items, :amount , :decimal , precision: 10, scale: 2
  end
end
