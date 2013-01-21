# == Schema Information
#
# Table name: areas
#
#  id         :integer          not null, primary key
#  name       :string(255)
#  country    :string(255)
#  slug       :string(255)
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Area < ActiveRecord::Base
  extend FriendlyId
    friendly_id :area_country, :use => :slugged
    
   validates_presence_of :slug, :name, :country
   attr_accessible :name, :country
   has_many :climbs
   has_many :ascents, :through => :climbs
   #validates_inclusion_of :country, :in => Carmen::country_codes, :message => "must select a country"
   def area_country
     "#{country} #{name}"
   end
   
   # use find_by_sql until I can figure out how to do this a better way
   #def ascent_count
   #  return Ascent.find_by_sql("SELECT AR.* FROM Ascents A INNER JOIN Climbs C on A.climb_id = C.id 
   #  INNER JOIN Areas AR on C.area_id = AR.id Where AR.id = #{self.id}").count.to_s
   #end
end
