class Authentication::UsersController < ApplicationController
    def new
        @user=User.new
    end

    def create
        @user=User.new(user_params)
        
        if @user.save
            redirect_to publicaciones_path, notice: 'tu cuenta se ha creado'
        else
            render :new, status:  :unprocessable_entity
        end
    end

    def user_params
        params.require(:user).permit(:emails, :username, :password)
    end
      

end