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

require 'test_helper'

class HeadwordJobTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
