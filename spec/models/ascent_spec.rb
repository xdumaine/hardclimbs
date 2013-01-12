# == Schema Information
#
# Table name: ascents
#
#  id         :integer          not null, primary key
#  date       :date
#  climb_id   :integer
#  media_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  climber_id :integer
#

require 'spec_helper'

describe Ascent do
  pending "add some examples to (or delete) #{__FILE__}"
end
