class Task < ApplicationRecord
	belongs_to :project, optional: true
	belongs_to :user

	mount_uploader :image, AvatarUploader

	validates_length_of :description, minimum: 2, allow3blank: true
end
