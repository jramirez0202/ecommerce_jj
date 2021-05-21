class AddressesController < InheritedResources::Base

  def new
    @users = User.all
    @address = current_user.addresses.build
  end
  
  def create
    @address = current_user.addresses.build(address_params)

    respond_to do |format|
      if @address.save
        format.html { redirect_to cart_path, notice: "address was successfully created." }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @address.errors, status: :unprocessable_entity }
      end
    end
  

  end
  

  private

    def address_params
      params.require(:address).permit(:FullName, :phone, :email, :street, :build, :place, :city, :comuna, :user_id)
    end

end


