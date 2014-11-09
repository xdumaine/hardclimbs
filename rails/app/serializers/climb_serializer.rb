class ClimbSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :name, :still_hard, :notes, :slug

  has_many :ascents
  has_many :climbers
  #has_many :medias
  has_one :style
  has_one :area
  has_one :grade
end
