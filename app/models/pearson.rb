# == Schema Information
#
# Table name: pearsons
#
#  id         :integer          not null, primary key
#  word       :string
#  response   :text
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Pearson < ActiveRecord::Base
  # this comment is for codeanywhere.com :)
end
