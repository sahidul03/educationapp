class AdminsController < ApplicationController

  before_action :common_method

  def index

  end

  def admission
    @student = Student.new
    # raise @student.inspect
  end

  def show

  end

  def create_student_and_guardian

  end


  protected
  def common_method
    render layout: 'admin_layout'
  end

end
