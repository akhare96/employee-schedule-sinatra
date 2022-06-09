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

    post '/employees' do
        if logged_in?
            @employee = Employee.create(name: params[:name], address: params[:address], phone_number: params[:phone_number], schedule: params[:schedule])
            if @employee.save
                @employee.business = params[:business]
                redirect "/employees/#{@employee.id}"
            else
                redirect '/employees/new'
            end
        else
            redirect '/login'
        end
    end

end
