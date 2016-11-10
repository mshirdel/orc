# == Schema Information
#
# Table name: headwords
#
#  id             :integer          not null, primary key
#  dataset        :string
#  headword       :string
#  headword_id    :string
#  part_of_speech :string
#  url            :string
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

class Headword < ActiveRecord::Base
	has_many :pronounciations
	has_many :senses
end
