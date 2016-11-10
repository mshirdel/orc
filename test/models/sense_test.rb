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

require 'test_helper'

class SenseTest < ActiveSupport::TestCase
  # test "the truth" do
  #   assert true
  # end
end
