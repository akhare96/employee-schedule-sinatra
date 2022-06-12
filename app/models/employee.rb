class Employee < ActiveRecord::Base
    belongs_to :business
    validates :name, :address, :phone_number, presence: true
    validates :name, :address, uniqueness: { scope: :business_id, case_sensitive: false }
end