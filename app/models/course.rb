class Course < ActiveRecord::Base
	has_many :notes
	has_many :todo_items
	belongs_to :user
end
