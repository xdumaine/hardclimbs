# == Schema Information
#
# Table name: climbers
#
#  id         :integer          not null, primary key
#  first_name :string(255)
#  last_name  :string(255)
#  sex        :string(255)
#  dob        :date
#  height     :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Climber < ActiveRecord::Base
  
  SEX = ['M', 'F']
  
  attr_accessible :first_name, :last_name, :dob, :height, :sex, :as => :admin
  
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_inclusion_of :sex, :in => SEX, :message => "must select a gender"
  def full_name
    "#{first_name} #{last_name}"
  end

  #has_many :ascents
  #has_many :media
end
