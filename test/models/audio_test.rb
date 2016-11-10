# == Schema Information
#
# Table name: audios
#
#  id                :integer          not null, primary key
#  lang              :string
#  p_type            :string
#  url               :string
#  pronounciation_id :integer
#  created_at        :datetime         not null
#  updated_at        :datetime         not null
#

require 'test_helper'

class AudioTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
