class Catagory < ApplicationRecord
  has_many :joins, foreign_key: 'catagories_id', class_name: 'Join'
  has_many :items, through: :joins # Edit :needs to be plural same as the has_many relationship

  validates :name, :icon, presence: true, length: { maximum: 255 }

  def total_amount(user_id)
    items.where(author_id: user_id).sum('amount')
  end
end
