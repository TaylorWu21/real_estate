class Address < ActiveRecord::Base
	belongs_to :home

	validates_presence_of :street_name, :city, :state
end
