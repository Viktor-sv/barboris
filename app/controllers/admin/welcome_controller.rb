class Admin::WelcomeController < ApplicationController


  def show
    @admin = current_admin
  end
end
