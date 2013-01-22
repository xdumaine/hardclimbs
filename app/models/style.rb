# == Schema Information
#
# Table name: styles
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Style < ActiveRecord::Base
  attr_accessible :name, :style_id
  has_one :climb
  has_many :grades
  validates_presence_of :name
end
