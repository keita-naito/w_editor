class Api::V1::ArticlePreviewSerializer < ActiveModel::Serializer
  attributes :id, :title, :updated_at
  belongs_to :user
end
