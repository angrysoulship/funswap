class PagesController < ApplicationController
  # skip_before_action :authenticate_user!, only: :home
  before_action :configure_permitted_parameters, if: :devise_controller?

  def home
    @collections = policy_scope(Collection)

  end



  private

  def configure_permitted_parameters
    # For additional fields in app/views/devise/registrations/new.html.erb


    devise_parameter_sanitizer.permit(:sign_up, :name)

    # For additional in app/views/devise/registrations/edit.html.erb
    devise_parameter_sanitizer.permit(:account_update, :name)

  end
end
