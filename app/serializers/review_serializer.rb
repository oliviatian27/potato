class ReviewSerializer < ActiveModel::Serializer
  attributes :id,:content,:rating,:created_at
  belongs_to :user
  belongs_to :tvmovie
end
