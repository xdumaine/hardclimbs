class AscentSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :date, :created_at, :updated_at, :slug,
  :ascent_number, :medias_count, :date_end, :notes

  has_one :climber
  has_one :climb
  #has_many :medias
  has_one :grade
  has_one :climb
end
