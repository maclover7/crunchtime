class Note < ActiveRecord::Base
	belongs_to :course
	belongs_to :user
	has_attached_file :image, :styles => { :medium => "300x300>", :thumb => "100x100>" }
end
