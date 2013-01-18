# == Schema Information
#
# Table name: media_types
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class MediaType < ActiveRecord::Base
  attr_accessible :name
  has_many :medias
end
