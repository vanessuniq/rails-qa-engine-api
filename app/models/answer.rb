class Answer < ApplicationRecord
  belongs_to :question
  belongs_to :user

  validates_presence_of :user_id, :body, :question_id
end
