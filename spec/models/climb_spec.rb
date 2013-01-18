# == Schema Information
#
# Table name: climbs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  style_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  slug       :string(255)
#  still_hard :boolean
#

require 'spec_helper'

describe Climb do
  pending "add some examples to (or delete) #{__FILE__}"
end
