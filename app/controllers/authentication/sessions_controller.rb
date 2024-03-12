class Authentication::SessionsController < ApplicationController
    def new
    end

    def create
        @user=User.find_by("emails= :login OR username = :login", {login: params[:login]})
        
        if @user.authenticate(params[:password])
            redirect_to publicaciones_path, notice: 'Bienvenido'
        else
            render :new, status:  :unprocessable_entity
        end
    end

    
      

end