# == Schema Information
#
# Table name: headword_jobs
#
#  id         :integer          not null, primary key
#  head_word  :string
#  is_done    :boolean
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class HeadwordJob < ActiveRecord::Base
end
