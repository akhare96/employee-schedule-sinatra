class User < ActiveRecord::Base
    has_secure_password
    has_many :user_businesses
    has_many :businesses, through: :user_businesses
    has_many :employees, through: :businesses
    validates :name, :email, presence: true
    validates :email, uniqueness: { case_sensitive: false }
end