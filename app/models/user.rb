class User < ActiveRecord::Base
    has_many :notices
    before_save :set_image
    def set_image
        self.image = "pug.jpg" if self.image.blank?
    end
    validates :first_name, presence: true
    validates :last_name, presence: true
    validates :location, presence: true
    validates :gender, presence: true
    validates :age, presence: true
    validates :username, presence: true, length: {minimum: 2}
    validates :password, presence: true, length: {minimum: 8}
    validates :email, presence: true, uniqueness: true, format: /\A[a-z0-9\._-]+@[a-z0-9\._-]+\.[a-z]{1,5}\z/
end
