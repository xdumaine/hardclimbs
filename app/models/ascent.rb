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
#  medias_count  :integer          default(0)
#  date_end      :date
#  notes         :text
#

class Ascent < ActiveRecord::Base
  extend FriendlyId
    friendly_id :ascent_name_climber_climb, :use => :slugged
  validates_presence_of :slug
    
  before_create :ascent_numbering
  after_create :update_climb
  after_update :update_climb
  
  ASCENT_NUMBER = [1,2,3,4,5,6,7,8,9,10,11,12,13,14,15,16,17,18,19,20]
  
  attr_accessible :date, :date_end, :climber_id, :climb_id, :media_ids, :grade_id, :ascent_number, :medias_count, :notes
  belongs_to :climber
  belongs_to :climb
  has_and_belongs_to_many :medias, :class_name => 'Media'
  belongs_to :grade
  
  counter_culture :grade
  counter_culture :climb
  counter_culture :climber
  
  validates :climber_id, :uniqueness => {:scope => :climb_id, :message => "That climber already sent that climb!"}
  validates_presence_of :climber, :climb, :grade;
    
  scope :by_area_order_asc, joins(:climb => :area).order("areas.name asc")
  scope :by_area_order_desc, joins(:climb => :area).order("areas.name desc")
  scope :by_style_order_asc, joins(:climb => :style).order("styles.name asc")
  scope :by_style_order_desc, joins(:climb => :style).order("styles.name desc")
  
  def self.order_by_join(join_model, sort_column, sort_direction = 'asc')
      if join_model == nil
          order("#{sort_column} #{sort_direction}")
      else
        if sort_column == 'areas.name'
          if sort_direction == 'asc'
            self.by_area_order_asc
          else
            self.by_area_order_desc
          end
        elsif sort_column == 'styles.name'
          if sort_direction == 'asc'
            self.by_style_order_asc
          else
            self.by_style_order_desc
          end
        else
          joins(join_model.parameterize.underscore.to_sym).order("#{sort_column} #{sort_direction}")
        end
      end
  end
    
  def ascent_date
    if date == nil
      "Unknown"
    elsif date == date_end
      date.strftime("%B %d, %Y")
    else
      if date.month == date_end.month
        date.strftime("%B, %Y")
      else
        date.strftime("%Y")
      end
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
  
  def update_counters()
    Ascent.all.each do |a|
      media_count = a.medias.count
      if media_count != a.medias_count
        puts "Updating #{a.ascent_name_climber_climb} from #{a.medias_count} to #{media_count} medias"
        a.update_attributes(:medias_count => media_count)
      end
    end
  end
  
  private
    def ascent_numbering
      current_ascent = Ascent.where(["climb_id=?", self.climb_id]).maximum("ascent_number")
      if self.ascent_number == nil && current_ascent != nil
        self.ascent_number = current_ascent + 1
     # elsif self.ascent_number != nil
      #  Ascent.increment(self.ascent_number, self.climb_id, self.climber_id)
     elsif self.ascent_number == nil
        #FA
        self.ascent_number = 1
      end
    end
      
    def update_climb
      if self.ascent_number == 1 && self.grade_id != nil
        Climb.find_by_id(self.climb).update_attributes(:grade_id => self.grade.id)
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
