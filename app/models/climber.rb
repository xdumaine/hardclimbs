# == Schema Information
#
# Table name: climbers
#
#  id            :integer          not null, primary key
#  first_name    :string(255)
#  last_name     :string(255)
#  sex           :string(255)
#  dob           :date
#  height        :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  slug          :string(255)
#  climbs_count  :integer          default(0)
#  ascents_count :integer          default(0)
#

class Climber < ActiveRecord::Base
  extend FriendlyId
    friendly_id :full_name, use: [:slugged, :finders]
  validates_presence_of :slug
  SEX = ['M', 'F']

  include PgSearch
    multisearchable :against => [:first_name, :last_name]

  validates :first_name, presence: true
  validates :last_name, presence: true
  validates_inclusion_of :sex, :in => SEX, :message => "must select a gender"
  def full_name
    "#{first_name} #{last_name}"
  end
  def friendly_dob
    if dob == nil
      "Unknown"
    else
      "#{dob.strftime("%B %d, %Y")}"
    end
  end

  has_many :climbs, :through => :ascents
  has_many :ascents

  def update_counters()
    Climber.all.each do |a|
      climb_count = a.climbs.count
      if climb_count != a.climbs_count
        puts "Updating #{a.full_name} from #{a.climbs_count} to #{climb_count} climbs"
        a.update_attributes(:climbs_count => climb_count)
      end

      ascents_count = a.ascents.still_hard.count
      if ascents_count != a.ascents_count
        puts "Updating #{a.full_name} from #{a.ascents_count} to #{ascents_count} ascents"
        a.update_attributes(:ascents_count => ascents_count)
      end
    end
  end
end
