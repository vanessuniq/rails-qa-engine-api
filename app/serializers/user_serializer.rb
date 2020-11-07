class UserSerializer < ActiveModel::Serializer
  attributes :id, :username, :bio, :avatar
  has_many :questions
  has_many :answers
  has_many :votes
end
