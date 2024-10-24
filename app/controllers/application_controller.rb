class ApplicationController < ActionController::Base
  # Only allow modern browsers supporting webp images, web push, badges, import maps, CSS nesting, and CSS :has.
  allow_browser versions: :modern

  before_action :authenticate_user!  # Ensures user must be signed in to access other routes

  # Redirect to main#index after sign in
  def after_sign_in_path_for(resource)
    main_index_path  # Replace this with the appropriate route
  end
  
  # Redirect to authentication page after sign out
  def after_sign_out_path_for(resource_or_scope)
    new_user_session_path  # Redirect to the sign in page
  end
end