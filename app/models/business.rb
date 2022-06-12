class Business < ActiveRecord::Base
    has_many :employees
    has_many :user_businesses
    has_many :users, through: :user_businesses
    validates :name, :location, presence: true
    validates :location, uniqueness: { case_sensitive: false }
end
