# == Schema Information
#
# Table name: grades
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  rank       :integer
#  style_id   :integer
#  slug       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Grade < ActiveRecord::Base
  attr_accessible :name, :style_id, :rank#, :as => :admin
  has_many :ascents
  belongs_to :style
end
