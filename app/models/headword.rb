class Headword < ActiveRecord::Base
	has_many :pronounciations
	has_many :senses
end
