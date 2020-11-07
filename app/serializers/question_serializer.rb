class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :topic, :reactions, :created_at
  has_many :answers
  belongs_to :user
end
