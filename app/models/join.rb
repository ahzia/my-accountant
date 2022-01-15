class Join < ApplicationRecord
  belongs_to :catagories, class_name: :Catagory
  belongs_to :items, class_name: :Item
end
