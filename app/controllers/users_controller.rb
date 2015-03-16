class UsersController < ApplicationController

  # before_action :common_method_user

  def index
    redirect_to admins_path
  end


  protected
  def common_method_user
    render layout: 'admin_layout'
  end

end
