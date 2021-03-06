class ApplicationController < ActionController::Base
	before_filter :configure_permitted_parameters, if: :devise_controller?
	before_filter do
		resource = controller_name.singularize.to_sym
		method = "#{resource}_params"
		params[resource] &&= send(method) if respond_to?(method, true)
	end
	# Prevent CSRF attacks by raising an exception.
	# For APIs, you may want to use :null_session instead.
	protect_from_forgery with: :exception

	rescue_from CanCan::AccessDenied do |exception|
		redirect_to root_path, :alert => exception.message
	end

	protected

		def configure_permitted_parameters
			devise_parameter_sanitizer.for(:sign_up) do |u|
				u.permit(:name, :email, :password, :password_confirmation, :current_password, :role_ids)
			end
			devise_parameter_sanitizer.for(:account_update) do |u|
				u.permit(:name, :email, :password, :password_confirmation, :current_password, :role_ids)
			end
		end
end
