class AdminsController < ApplicationController

  before_action :common_method, except: [:year_load, :semester_load, :shift_load,:create_student_and_guardian,
                                         :student_profile,:student_search,:show_student_according_to_class,:student_list,
                                         :student_count,:student_count_class_wise,:show_students_according_to_gender,
                                         :search_students_according_to_gender,:fee_create]

  def index

  end

  def admission
    @student = Student.new()

  end

  def show

  end

  def create_student_and_guardian
    #guardian registration
    uid=User.last.id if User.last
    uid=uid+1
    guardian_username=params[:student_first_name].delete(' ').downcase+"_"+uid.to_s
    guardian_email=guardian_username+'@convergentsoft.com'
    guardian=User.new(:user_name=>guardian_username,:user_flag=>5,:name=>params[:student][:local_guardian],:password=>params[:guardian_contact_number],:email=>guardian_email)
    #student registration
    uid=uid+1
    student_username=params[:student_first_name].delete(' ').downcase+"_"+uid.to_s
    student_email=student_username+'@convergentsoft.com'
    student=User.new(:user_name=>student_username,:user_flag=>6,:name=>params[:student_first_name],:password=>params[:guardian_contact_number],:email=>student_email,:profilepic=>params[:student][:profilepic])
    if guardian.save
      if student.save
        guardian_table=guardian.guardians.new(:name=>params[:student][:local_guardian],:contact_number=>params[:guardian_contact_number])
        if guardian_table.save
          student_table=student.students.new(:guardian_id=>guardian_table.id,:campus_id=>params[:select_campus],:first_name=>params[:student_first_name],:last_name=>params[:student_last_name],:father_name=>params[:student][:father_name],:mother_name=>params[:student][:mother_name],:local_guardian=>params[:student][:local_guardian],:relationship_with_guardian=>params[:student][:relationship_with_guardian],:contact_number=>params[:student_contact_number],:gender=>params[:student][:gender],:profilepic=>params[:student][:profilepic],:coverpic=>params[:student][:coverpic],:level_id=>params[:select_level])
          if student_table.save
            # raise student_table.inspect
            shft=Shift.find(params[:select_shift])
            student_table.shifts<<shft
            redirect_to student_profile_admins_path(student)
          end
        end
      end
    end
  end

  def year_load
    l=Level.find(params[:level_id])
    if l
      @years=l.years
    end
  end

  def semester_load
    y=Year.find(params[:year_id])
    if y
      @semesters=y.semesters
    end
  end

  def shift_load
    sh=Semester.find(params[:semester_id]) rescue nil
    if sh
      @shifts=sh.shifts
    end
  end

  def student_profile
    @user=User.find(params[:id]) rescue nil
    if @user
      @student=@user.students.first
      render layout: 'admin_layout'
    else
      redirect_to admins_path
    end
  end

  def student_list
    @all_students=[]
    @default_class=Level.first rescue nil
    if @default_class
      @all_students=@default_class.students
    end
    render layout: 'admin_layout'
  end

  def student_search
    usr=User.find(params[:student_id]) rescue nil
      if usr
        @stdnt=usr.students.first
      else
        @stdnt= false
      end
  end

  def show_student_according_to_class
    @all_students_AC=[]
    @default_class_AC=Level.find(params[:class_id]) rescue nil
    if @default_class_AC
      @all_students_AC=@default_class_AC.students
    end
  end


  def student_count
  end

  def student_count_class_wise
    @level=Level.find(params[:id]) rescue nil
    if @level
      render layout: 'admin_layout'
    else
      redirect_to admins_path
    end
  end

  def show_students_according_to_gender
    lvl=Level.find(params[:level_id]) rescue nil
    if lvl
      @stdnt_AT_gender=lvl.students.where(:gender=>params[:gender])
    else
      redirect_to admins_path
    end
  end


  def search_students_according_to_gender
    if params[:student_id]==''
      lvl=Level.find(params[:level_id])
      @stdnt=lvl.students if lvl
    else
      usr=User.find(params[:student_id]) rescue nil
      if usr
        @stdnt=usr.students.first
      else
        @stdnt= false
      end
    end
  end

  # def fee_setting
  # end
  #
  # def fee_create
  #   fee=Fee.new(fee_params)
  #   if fee.save
  #     flash[:notice] = "Post successfully created"
  #     redirect_to fee_setting_admins_path
  #   else
  #     redirect_to fee_setting_admins_path
  #   end
  #
  # end

  protected
  # def fee_params
  #   params.require(:fee).permit(:monthly_fee, :session_fee, :admission_fee, :ict_fee, :exam_fee, :others, :comment).merge(:level_id=> params[:select_level],:month_id=>params[:select_month])
  # end
  def common_method
    render layout: 'admin_layout'
  end


end
