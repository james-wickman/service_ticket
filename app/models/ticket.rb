class Ticket < ApplicationRecord

	has_attached_file :image, styles: { small: "64x64", med: "100x100", large: "200x200" }
	belongs_to :system
	has_many :equipment_useds
end
