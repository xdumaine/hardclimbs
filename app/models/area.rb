# == Schema Information
#
# Table name: areas
#
#  id            :integer          not null, primary key
#  name          :string(255)
#  country       :string(255)
#  slug          :string(255)
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  climbs_count  :integer          default(0)
#  ascents_count :integer          default(0)
#

class Area < ActiveRecord::Base
  extend FriendlyId
    friendly_id :area_country, :use => :slugged
    
    include PgSearch
      multisearchable :against => [:name]
      
   validates_presence_of :slug, :name, :country
   attr_accessible :name, :country
   has_many :climbs
   has_many :ascents, :through => :climbs
   
   def area_country
     "#{country} #{name}"
   end
   
   def self.order_by_join(join_model, sort_column, sort_direction = 'asc')
       if join_model == nil
         order("#{sort_column} #{sort_direction}")
       else
         joins(join_model.parameterize.underscore.to_sym).order("#{sort_column} #{sort_direction}")
       end
   end
   
end
