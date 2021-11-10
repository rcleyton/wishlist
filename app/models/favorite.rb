class Favorite < ApplicationRecord
  belongs_to :user
  # serialize :product_id, Array
end
