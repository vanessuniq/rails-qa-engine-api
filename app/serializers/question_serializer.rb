class QuestionSerializer < ActiveModel::Serializer
  attributes :id, :title, :body, :topic, :created_at
  has_many :answers
  has_many :votes, as: :votable
  belongs_to :user
end
