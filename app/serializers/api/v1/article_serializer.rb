class Api::V1::ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :updated_at
  belongs_to :user
end
