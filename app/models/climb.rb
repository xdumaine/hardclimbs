# == Schema Information
#
# Table name: climbs
#
#  id             :integer          not null, primary key
#  name           :string(255)
#  style_id       :integer
#  created_at     :datetime         not null
#  updated_at     :datetime         not null
#  slug           :string(255)
#  still_hard     :boolean
#  area_id        :integer
#  climbers_count :integer          default(0)
#  ascents_count  :integer          default(0)
#  medias_count   :integer          default(0)
#

class Climb < ActiveRecord::Base
  extend FriendlyId
    friendly_id :name, :use => :slugged
  validates_presence_of :slug
  
  attr_accessible :name, :media_id, :style_id, :still_hard, :area_id
  has_many :climbers, :through => :ascents
  has_many :ascents
  has_many :medias
  belongs_to :style, :counter_cache => true
  belongs_to :area, :counter_cache => true
  validates_presence_of :style, :area
  
  def climb_area_name
    "#{name} (#{area.name})"
  end
  
  def self.order_by_join(join_model, sort_column, sort_direction = 'asc')
      if join_model == nil
        order("#{sort_column} #{sort_direction}")
      else
        joins(join_model.parameterize.underscore.to_sym).order("#{sort_column} #{sort_direction}")
      end
  end
  
end
