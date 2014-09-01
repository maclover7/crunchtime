class Note < ActiveRecord::Base
	belongs_to :course
	belongs_to :user
	include Bootsy::Container
end
