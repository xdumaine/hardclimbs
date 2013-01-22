# == Schema Information
#
# Table name: ascents
#
#  id            :integer          not null, primary key
#  date          :date
#  climb_id      :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  climber_id    :integer
#  slug          :string(255)
#  grade_id      :integer
#  ascent_number :integer
#

class Ascent < ActiveRecord::Base
  extend FriendlyId
    friendly_id :ascent_name_climber_climb, :use => :slugged
  validates_presence_of :slug
  
  before_create :ascent_numbering
  
  ASCENT_NUMBER = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
  
  attr_accessible :date, :climber_id, :climb_id, :media_id, :grade_id, :ascent_number
  belongs_to :climber
  belongs_to :climb
  has_many :media
  belongs_to :grade
  
  validates :climber_id, :uniqueness => {:scope => :climb_id, :message => "That climber already sent that climb!"}
  validates_presence_of :climber_id, :climb_id;
    
  def ascent_date
    if date == nil
      "Unknown"
    else
      date
    end
  end
  
  def ascent_name_climber_climb
    if climber and climb
      "#{climber.full_name} #{climb.name}"
    else
      ""
    end
  end
  
  def ascent_number_format
    if ascent_number == nil
      ""
    elsif ascent_number == 1
      "FA"
    else
      "#{ascent_number.ordinalize}"
    end
  end
  
  private
      def ascent_numbering
        current_ascent = Ascent.where(["climb_id=?", self.climb_id]).maximum("ascent_number")
        if self.ascent_number == nil && current_ascent != nil
          self.ascent_number = current_ascent + 1
        else
          #FA
          self.ascent_number = 1
        end
      end
      
  def self.increment(position_threshold, climb_id, climber_id)
    Ascent.transaction do
       Ascent.where(["ascent_number >= ?", position_threshold]).where(["climb_id=?", climb_id]).where(["climber_id!=?", climber_id]).order("ascent_number DESC").each do |ascent|
          ascent.ascent_number += 1
          ascent.save
       end
    end
  end
  
end
