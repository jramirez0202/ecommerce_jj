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

	
	private
	def set_user
		@user = User.find(params[:id])
	end


	def user_params
		params.require(:user).permit(:email, :id)
	end
end
