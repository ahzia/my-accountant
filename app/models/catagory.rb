class Catagory < ApplicationRecord
  has_many :joins, foreign_key: 'catagories_id', class_name: 'Join'
  has_many :items, through: :joins # Edit :needs to be plural same as the has_many relationship
end
