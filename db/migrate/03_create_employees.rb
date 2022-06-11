class CreateEmployees < ActiveRecord::Migration[5.2]
    def change
        create_table :employees do |t|
            t.string :name
            t.string :address
            t.string :phone_number
            t.string :monday_sched
            t.string :tuesday_sched
            t.string :wednesday_sched
            t.string :thursday_sched
            t.string :friday_sched
            t.string :saturday_sched
            t.string :sunday_sched
            t.integer :business_id
        end
    end
end
