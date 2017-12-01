class User < ApplicationRecord
  acts_as_liker

  has_many :images
  has_many :tags

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_attached_file :avatar, :styles => { :medium => "300x300>", :thumb => "100x100#" }, :default_url => "/images/:style/missing.jpg"
  validates_attachment_content_type :avatar, :content_type => /\Aimage\/.*\Z/

  after_create :send_admin_mail

  def send_admin_mail
    UserMailer.send_new_user_message(self).deliver
  end

  

end
