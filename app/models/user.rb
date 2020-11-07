class User < ApplicationRecord
    before_save :downcase_username
    has_secure_password

    has_many :questions, dependent: :destroy
    has_many :answers, dependent: :destroy
    
    validates :username, uniqueness: {case_sensitive: false}, length: {minimum:4}
    validates :password, presence: true, length: { minimum: 5}, allow_nil: true

    private

    def downcase_username
         self.username = self.username.downcase
    end

end
