# == Schema Information
#
# Table name: medias
#
#  id            :integer          not null, primary key
#  url           :string(255)
#  description   :string(255)
#  media_type_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  climb_id      :integer
#  ascent_id     :integer
#

require 'spec_helper'

describe Media do
  pending "add some examples to (or delete) #{__FILE__}"
end
