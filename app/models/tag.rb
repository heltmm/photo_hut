class Tag < ApplicationRecord
  belongs_to :image
  belongs_to :user
end
