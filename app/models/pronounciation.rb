class Pronounciation < ActiveRecord::Base
	belongs_to :headword
	has_many :audios
end
