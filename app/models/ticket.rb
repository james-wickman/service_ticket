class Ticket < ApplicationRecord

	has_attached_file :image
	validates_attachment :image, :content_type => { :content_type => %w(application/pdf application/msword application/vnd.openxmlformats-officedocument.wordprocessingml.document application/vnd.ms-excel application/vnd.openxmlformats-officedocument.spreadsheetml.sheet text/plain) }
	belongs_to :system, optional: true
	has_many :equipment_useds
end
