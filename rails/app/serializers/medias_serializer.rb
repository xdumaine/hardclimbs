class MediasSerializer < ActiveModel::Serializer
  attributes :id, :url, :description, :pull_quote

  has_one :media_type
  has_one :ascent
end
