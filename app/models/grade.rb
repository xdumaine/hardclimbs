# == Schema Information
#
# Table name: grades
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  rank          :integer
#  style_id      :integer
#  slug          :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  ascents_count :integer          default(0)
#  climbs_count  :integer          default(0)
#

class Grade < ActiveRecord::Base
  attr_accessible :name, :style_id, :rank#, :as => :admin
  has_many :ascents
  has_many :climbs
  belongs_to :style
  validates_presence_of :name, :style_id, :rank
  validates :rank, :uniqueness => {:scope => :style_id, :message => "There is already a grade with that rank!"}
end
