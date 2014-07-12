class GradeSerializer < ActiveModel::Serializer
  attributes :id, :name, :rank

  has_one :style
  has_many :climbs
  has_many :ascents
end
