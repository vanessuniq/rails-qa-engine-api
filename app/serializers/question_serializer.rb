class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :topic, :created_at
  has_many :answers
  belongs_to :user
end
