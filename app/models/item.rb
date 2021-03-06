class Item < ApplicationRecord
  belongs_to :author, class_name: :User
  has_many :joins, foreign_key: 'items_id', class_name: 'Join'
  has_many :catagories, through: :joins # Edit :needs to be plural same as the has_many relationship

  validates :name, :amount, presence: true, length: { maximum: 255 }
  validates :amount, numericality: { greater_than: 0 }
end
