class AnswerSerializer < ActiveModel::Serializer
  attributes :id, :body, :created_at, :votes, :user
  belongs_to :question
  #belongs_to :user
  #has_many :votes, as: :votable
  def user
    {id: object.user.id, username: object.user.username, avatar: object.user.avatar}
  end
  
end
