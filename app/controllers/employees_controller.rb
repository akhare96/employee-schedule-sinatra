class EmployeesController < ApplicationController
    get '/employees' do
        if logged_in?
            erb :'employees/show'
        else
            redirect '/login'
        end
    end
end
