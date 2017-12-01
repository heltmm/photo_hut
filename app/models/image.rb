class Image < ApplicationRecord
  belongs_to :user
  has_many :tags

  acts_as_likeable

  validates :photo, :presence => true



  has_attached_file :photo, styles: { medium: "300x300>", thumb: "100x100>" }, default_url: "/images/:style/missing.png"
  validates_attachment_content_type :photo, content_type: /\Aimage\/.*\z/


  scope :most_recent, -> { order(created_at: :desc)}

  scope :oldest, -> { order(created_at: :asc)}

  scope :most_liked, -> { order(likers_count: :desc)}


 scope :search, -> (search_parameter, page) { joins(:user).where("lower(users.username) like lower(?)", "%#{search_parameter}%").paginate(:page => page, :per_page => 1)}
end
