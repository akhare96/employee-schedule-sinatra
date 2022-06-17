require 'rack-flash'
require 'pry'
class EmployeesController < ApplicationController
    use Rack::Flash
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
            @employee = @business.employees.create(name: params[:name], address: params[:address], phone_number: params[:phone_number])
            @employee.monday_sched = params[:monday_sched]
            @employee.tuesday_sched = params[:tuesday_sched]
            @employee.wednesday_sched = params[:wednesday_sched]
            @employee.thursday_sched = params[:thursday_sched]
            @employee.friday_sched = params[:friday_sched]
            @employee.saturday_sched = params[:saturday_sched]
            @employee.sunday_sched = params[:sunday_sched]
            if @employee.save
                flash[:message] = "Successfuly created employee"
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
            permission_denied
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

    patch '/employees/:id' do
        if logged_in?
            @employee = Employee.find_by_id(params[:id])
            if current_user.employees.include?(@employee)
                @employee.update(name: params[:name], address: params[:address], phone_number: params[:phone_number])
                @employee.monday_sched = params[:monday_sched]
                @employee.tuesday_sched = params[:tuesday_sched]
                @employee.wednesday_sched = params[:wednesday_sched]
                @employee.thursday_sched = params[:thursday_sched]
                @employee.friday_sched = params[:friday_sched]
                @employee.saturday_sched = params[:saturday_sched]
                @employee.sunday_sched = params[:sunday_sched]
                @employee.business_id = params[:business]
                if @employee.save
                    redirect "/employees/#{@employee.id}"
                else
                    redirect "/employees/#{@employee.id}/edit"
                end
            else
                redirect '/employees'
            end
        else
            redirect '/login'
        end
    end

    delete '/employees/:id/delete' do
        if logged_in?
            @employee = Employee.find_by_id(params[:id])
            if current_user.employees.include?(@employee)
                @employee.delete
                redirect '/employees'
            else
                redirect "/employees/#{@employee.id}"
            end
        else
            redirect '/login'
        end
    end

end
