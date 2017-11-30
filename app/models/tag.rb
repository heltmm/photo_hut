class Tag < ApplicationRecord
  belongs_to :image
  has_one :user
end
