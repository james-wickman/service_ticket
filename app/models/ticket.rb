class Ticket < ApplicationRecord

	belongs_to :system
	has_many :equipment_useds
end
