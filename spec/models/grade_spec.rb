# == Schema Information
#
# Table name: grades
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  rank       :integer
#  style_id   :integer
#  slug       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

require 'spec_helper'

describe Grade do
  pending "add some examples to (or delete) #{__FILE__}"
end
