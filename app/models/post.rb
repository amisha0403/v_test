class Post < ApplicationRecord
	belongs_to :user
	mount_uploader :image, AvatarUploader

	enum category: [:Education, :Business, :Teaching]
	
	validates :title, :description, presence: true
  validates_length_of :description, minimum: 20, allow_blank: true
end
