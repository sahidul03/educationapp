class AdminsController < ApplicationController

  before_action :common_method, except: [:year_load, :semester_load, :shift_load,:create_student_and_guardian]

  def index

  end

  def admission
    @student = Student.new()

  end

  def show

  end

  def create_student_and_guardian
    uid=User.last.id if User.last
    uid=uid+1
    uname=params[:student_first_name].delete(' ')+"_"+uid.to_s
    # raise params[:password].inspect
    u=User.new(:user_name=>uname,:user_flag=>5,:name=>params[:student][:local_guardian],:password=>params[:password])
    if u.save!
      raise u.inspect
    end
  end

  def year_load
    l=Level.find(params[:level_id])
    @years=l.years
  end

  def semester_load
    y=Year.find(params[:year_id])
    @semesters=y.semesters
  end

  def shift_load
    sh=Semester.find(params[:semester_id])
    @shifts=sh.shifts
  end


  protected
  def common_method
    render layout: 'admin_layout'
  end


end
