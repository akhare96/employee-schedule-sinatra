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
            @business = Business.find_by_id(params[:business])
            @employee = @business.employees.create(name: params[:name], address: params[:address], phone_number: params[:phone_number], schedule: params[:schedule])
            if @employee.save
                redirect "/employees/#{@employee.id}"
            else
                redirect '/employees/new'
            end
        else
            redirect '/login'
        end
    end

    get '/employees/:id' do
        if logged_in?
            @employee = Employee.find_by_id(params[:id])
            erb :'employees/show_employee'
        else
            redirect '/login'
        end
    end

    get '/employees/:id/edit' do
        if logged_in?
            @employee = Employee.find_by_id(params[:id])
            if current_user.employees.include?(@employee)
                erb :'employees/edit'
            else
                redirect '/employees'
            end
        else
            redirect '/login'
        end
    end

end
