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

require 'test_helper'

class HeadwordTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
