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

class Climb < ActiveRecord::Base
  extend FriendlyId
    friendly_id :name, :use => :slugged
  validates_presence_of :slug
  
  attr_accessible :name, :media_id, :style_id, :still_hard#, :as => :admin
  has_many :climbers, :through => :ascents
  has_many :ascents
  has_many :medias
  belongs_to :style
  validates_presence_of :style
  
end
