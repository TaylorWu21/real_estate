class Seller < ActiveRecord::Base
	has_many :home, dependent: :destroy

	validates_presence_of :name
end
