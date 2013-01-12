# == Schema Information
#
# Table name: media
#
#  id             :integer          not null, primary key
#  url            :string(255)
#  description    :string(255)
#  media_types_id :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#

require 'spec_helper'

describe Media do
  pending "add some examples to (or delete) #{__FILE__}"
end
