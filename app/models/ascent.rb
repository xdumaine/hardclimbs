# == Schema Information
#
# Table name: ascents
#
#  id         :integer          not null, primary key
#  date       :date
#  climb_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  climber_id :integer
#  slug       :string(255)
#  grade_id   :integer
#

class Ascent < ActiveRecord::Base
  #extend FriendlyId
  #  friendly_id :climber_name, :use => :slugged
 # validates_presence_of :slug
  
  attr_accessible :date, :climber_id, :climb_id, :media_id, :grade_id#, :as => :admin
  belongs_to :climber
  belongs_to :climb
  has_many :media
  belongs_to :grade
  
end
