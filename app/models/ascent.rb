# == Schema Information
#
# Table name: ascents
#
#  id         :integer          not null, primary key
#  date       :date
#  climb_id   :integer
#  media_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#  climber_id :integer
#

class Ascent < ActiveRecord::Base
  attr_accessible :date, :climber_id, :climb_id, :media_id, :as => :admin
  belongs_to :climber
  belongs_to :climb
  has_many :medias
end
