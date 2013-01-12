# == Schema Information
#
# Table name: climbs
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  style_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Climb < ActiveRecord::Base
  attr_accessible :name, :style, :media_id, :style_id, :as => :admin
  has_many :climbers, :through => :ascents
  has_many :ascents
  has_many :medias
  has_one :style
end
