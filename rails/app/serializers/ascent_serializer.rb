class AscentSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :date, :created_at, :updated_at, :climber_id, :slug, :grade_id,
  :ascent_number, :medias_count, :date_end, :notes, :climb_id

  has_one :climber
  #has_one :climb
end
