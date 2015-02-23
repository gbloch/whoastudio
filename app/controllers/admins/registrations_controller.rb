class Admins::RegistrationsController < ::Devise::RegistrationsController
  layout "admin"

  def account_update_params
    params.require(:admin).permit(:first_name,
                                  :last_name,
                                  :email,
                                  :password,
                                  :password_confirmation,
                                  :current_password)
  end

  def after_update_path_for(resource)
    edit_admin_registration_path(resource)
  end
end
