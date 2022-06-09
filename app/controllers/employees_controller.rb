class EmployeesController < ApplicationController
    get '/employees' do
        if logged_in?
            erb :'employees/show'
        else
            redirect '/login'
        end
    end

    get '/employees/new' do
        if logged_in?
            erb :'employees/new'
        else
            redirect 'login'
        end
    end

end
