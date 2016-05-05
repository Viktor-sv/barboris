class Admin::ApplicationController < ActionController
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  before_action :authenticate_admin!
  layout 'admin_application'
end
