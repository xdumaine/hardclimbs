class AreaSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :name, :country, :slug

  has_many :climbs
  #has_many :ascents
end
