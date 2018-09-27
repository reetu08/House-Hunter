class RegistrationsController < Devise::RegistrationsController
  before_action :configure_permitted_parameters, if: :devise_controller?

  def build_resource(hash = {})
    super
    if(@_action_name == 'create')
        self.resource.role_ids = params[:user][:role_ids]
    end
  end

  def update_resource(resource, password)
    if !resource.admin? and params[:user][:role_ids].nil?
      resource.errors.add(:role_ids, 'Must have at least one Role selected')
      return false
    end
    if !resource.admin?
      resource.role_ids = params[:user][:role_ids]
    end
    super resource, password
  end

  protected

  def configure_permitted_parameters
    devise_parameter_sanitizer.permit(:account_update, keys: [:name, :phone, :preferred_contact])
    devise_parameter_sanitizer.permit(:sign_up, keys: [:name, :phone, :preferred_contact])
  end

end