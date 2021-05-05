class UsersController < ApplicationController
	before_action :set_user, only: [:edit, :update] #importante agregar
	before_action :authenticate_user!
	#load_and_authorize_resource
	def index
		# user = params[:keyword]
		# @users = User.paginate(page: params[:page], per_page: 20)
		# if user.present?
		# 	@users = @users.where("name ILIKE ?",user)
		# end
	end

	def edit
		current_user = User.find(params[:id])
	end

	def update
		respond_to do |format|
			if @user.update(admin_params)
		format.html { redirect_to admin_index_path, success: 'Actualizado' }
			else
		format.html { redirect_to admin_index_path, success: 'No se guardo' }
			end
		end
	end

	def finish_signup
    if request.patch? && params[:user] # Revisa si el request es de tipo patch, es decir, llenaron el formulario y lo ingresaron
      @user = User.find(params[:id])

      if @user.update(user_params)
        sign_in(@user, :bypass => true)
        redirect_to root_path, notice: 'Hemos guardado tu email correctamente.'
      else
        @show_errors = true
      end
    end
  end

	
	private
	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		accessible = [ :name, :email ] # extend with your own params
		accessible << [ :password, :password_confirmation ] unless params[:user][:password].blank?
		params.require(:user).permit(accessible)
	end


	# def user_params
	# 	params.require(:user).permit(:email, :id)
	# end
end
