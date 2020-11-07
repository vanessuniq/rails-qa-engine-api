class Question < ApplicationRecord
    has_many :answers, dependent: :destroy
    belongs_to :user

    
    before_create :add_reactions

    validates :title, :body,  presence: true, length: { minimum: 4}
    validates_presence_of :user_id
    validates :topic, inclusion: {in: %w(Rails HTML CSS JS), message: "%{value} is not a valid topic in this forum"}
end
