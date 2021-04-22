class ApplicationController < ActionController::Base

    rescue_from CanCan::AccessDenied do |exception|
        redirect_to root_url, :alert => exception.message
        end


    def current_order
        if current_user
            order = Order.find_or_create_by(user_id: current_user.id, state: 'Created')
        end
    end
end
