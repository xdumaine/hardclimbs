# == Schema Information
#
# Table name: medias
#
#  id            :integer          not null, primary key
#  url           :string(255)
#  description   :string(255)
#  media_type_id :integer
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#  pull_quote    :text
#

class Media < ActiveRecord::Base
  attr_accessible :url, :description, :media_type_id, :climb_ids, :ascent_ids, :pull_quote
  belongs_to :media_type
  has_and_belongs_to_many :ascent
  has_and_belongs_to_many :climb
  
  validates_presence_of :url
  validates_presence_of :media_type
  validates_presence_of :description
  validates_presence_of :climb, :unless => proc{|obj| obj.climb.blank?}
  validates_presence_of :ascent, :unless => proc{|obj| obj.ascent.blank?}

  auto_html_for :url do
    html_escape
    vimeo(:width => 0, :height => 0)
    youtube(:width => 0, :height => 0)
    link :target => "_blank"
    simple_format
  end
end
