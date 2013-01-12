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

class Media < ActiveRecord::Base
  attr_accessible :url, :description
  belongs_to :media_type
  belongs_to :ascent
  belongs_to :climb
end
