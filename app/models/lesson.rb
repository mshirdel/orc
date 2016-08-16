class Lesson < ActiveRecord::Base
	belongs_to :group
	validates :title, presence: true, length: { minimum: 5 }
end
