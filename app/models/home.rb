class Home < ActiveRecord::Base
	has_one :address, dependent: :destroy
	belongs_to :seller

	validates_presence_of :price
end
