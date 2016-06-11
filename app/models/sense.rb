class Sense < ActiveRecord::Base
	belongs_to :headword
	has_many :examples
end
