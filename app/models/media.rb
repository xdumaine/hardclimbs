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
#  climb_id      :integer
#  ascent_id     :integer
#

class Media < ActiveRecord::Base
  attr_accessible :url, :description, :media_types_id, :climb_id, :ascent_id, :as => :admin
  belongs_to :media_type
  belongs_to :ascent
  belongs_to :climb
end
