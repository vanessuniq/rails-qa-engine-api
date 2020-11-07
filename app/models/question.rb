class Question < ApplicationRecord
    has_many :answers, dependent: :destroy
    has_many :votes, as: :votable
    belongs_to :user

    validates :title, :body,  presence: true, length: { minimum: 4}
    validates_presence_of :user_id
    validates :topic, inclusion: {in: %w(Rails HTML CSS JS), message: "%{value} is not a valid topic in this forum"}
end
