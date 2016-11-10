# == Schema Information
#
# Table name: examples
#
#  id         :integer          not null, primary key
#  text       :text
#  sense_id   :integer
#  audio_type :string
#  audio_url  :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Example < ActiveRecord::Base
	belongs_to :sense
	
end
