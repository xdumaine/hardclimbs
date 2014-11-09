class ClimberSerializer < ActiveModel::Serializer
  embed :ids, include: true

  attributes :id, :first_name, :last_name, :slug, :created_at, :updated_at, :dob, :sex,
              :ascents_count, :climbs_count, :height, :full_name
  #has_many :ascents
end
