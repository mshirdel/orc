class Audio < ActiveRecord::Base
	belongs_to :pronounciation
	belongs_to :example
end
