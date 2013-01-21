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
#  area_id    :integer
#

class Climb < ActiveRecord::Base
  extend FriendlyId
    friendly_id :name, :use => :slugged
  validates_presence_of :slug
  
  attr_accessible :name, :media_id, :style_id, :still_hard, :area_id
  has_many :climbers, :through => :ascents
  has_many :ascents
  has_many :medias
  belongs_to :style
  belongs_to :area
  validates_presence_of :style, :area
  
  def climb_area_name
    "#{name} (#{area.name})"
  end
end
