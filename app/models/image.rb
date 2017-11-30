class Image < ApplicationRecord
  belongs_to :user
  has_many :tags

  acts_as_likeable

  validates :photo, :presence => true



  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/


  scope :most_recent, -> { order(created_at: :desc)}

  scope :most_likes, -> {(
   select("images.id, images.description, images.photo_file_name, images.photo_content_type, images.photo_file_size, images.photo_updated_at, images.likers_count, count(likes.id) as likes_count")
   .joins(:likes)
   .group("images.id")
   .order("likes_count DESC")
   )}
end
