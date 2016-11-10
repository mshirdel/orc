# == Schema Information
#
# Table name: senses
#
#  id          :integer          not null, primary key
#  definition  :string
#  headword_id :integer
#  opposite    :string
#  created_at  :datetime         not null
#  updated_at  :datetime         not null
#

class Sense < ActiveRecord::Base
	belongs_to :headword
	has_many :examples
end
