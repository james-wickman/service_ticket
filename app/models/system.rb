class System < ApplicationRecord

	belongs_to :costumer, optional: true
	has_many :equipment_lists
	has_many :tickets
end
