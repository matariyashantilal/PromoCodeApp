class Ibeacon < ActiveRecord::Base
	belongs_to :store

	validates_presence_of :udid
end
