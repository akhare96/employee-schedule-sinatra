class CreateEmployees < ActiveRecord::Migration[5.2]
    def change
        create_table :employees do |t|
            t.string :name
            t.string :address
            t.string :phone_number
            t.string :schedule
            t.integer :business_id
        end
    end
end
