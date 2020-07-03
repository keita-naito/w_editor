class Api::V1::ArticleSerializer < ActiveModel::Serializer
  attributes :id, :title, :body
  belongs_to :user
end
