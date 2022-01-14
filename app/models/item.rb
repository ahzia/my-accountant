class Item < ApplicationRecord
  belongs_to :author_id, class_name: :User
end
