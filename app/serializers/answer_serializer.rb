class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at
  belongs_to :question
  belongs_to :user
end
