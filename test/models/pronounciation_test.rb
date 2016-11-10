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

require 'test_helper'

class PronounciationTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
