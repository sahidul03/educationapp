class AdminsController < ApplicationController

  before_action :common_method

  def index

  end




  protected
  def common_method
    render layout: 'admin_layout'
  end

end