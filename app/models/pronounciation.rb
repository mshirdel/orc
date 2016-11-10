# == Schema Information
#
# Table name: pronounciations
#
#  id          :integer          not null, primary key
#  ipa         :string
#  headword_id :integer
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Pronounciation < ActiveRecord::Base
	belongs_to :headword
	has_many :audios
end
