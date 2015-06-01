class AdminsController < ApplicationController

  before_action :common_method, except: [:year_load, :semester_load, :shift_load,:create_student_and_guardian,:student_profile,:student_search,:show_student_according_to_class,:student_list,:student_count,:student_count_class_wise,:show_students_according_to_gender,:search_students_according_to_gender]

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

  def student_profile
    usr=User.where(:id=>params[:id])
    if usr.first
      @user=usr.first
      @student=@user.students.first
      render layout: 'admin_layout'
    else
      redirect_to admins_path
    end
  end

  def student_list
    @all_students=[]
    @default_class=Level.first
    if @default_class
        years=@default_class.years
        if years.any?
          years.each do |year|
            semesters=year.semesters
            if semesters.any?
              semesters.each do |semester|
                shifts=semester.shifts
                if shifts.any?
                  shifts.each do |shift|
                    students=shift.students
                    if students.any?
                      @all_students=@all_students+students
                    end
                  end
                end
              end
            end
          end
        end
    end
    render layout: 'admin_layout'
  end

  def student_search
      usr=User.where(:id=>params[:student_id])
      if usr.first
        @stdnt=usr.first.students.first
      else
        @stdnt= false
      end
  end

  def show_student_according_to_class
    @all_students_AC=[]
    @default_class_AC=Level.find(params[:class_id])
    if @default_class_AC
      years=@default_class_AC.years
      if years.any?
        years.each do |year|
          semesters=year.semesters
          if semesters.any?
            semesters.each do |semester|
              shifts=semester.shifts
              if shifts.any?
                shifts.each do |shift|
                  students=shift.students
                  if students.any?
                    @all_students_AC=@all_students_AC+students
                  end
                end
              end
            end
          end
        end
      end
    end
  end


  def student_count
  end

  def student_count_class_wise
    lvls=Level.where(:id=>params[:id])
    if lvls.first
      @level=lvls.first
      render layout: 'admin_layout'
    else
      redirect_to admins_path
    end
  end

  def show_students_according_to_gender
    lvl=Level.find(params[:level_id])
    @stdnt_AT_gender=lvl.students.where(:gender=>params[:gender])
  end


  def search_students_according_to_gender
    if params[:student_id]==''
      lvl=Level.find(params[:level_id])
      @stdnt=lvl.students if lvl
    else
      usr=User.where(:id=>params[:student_id])
      if usr.first
        @stdnt=usr.first.students.first
      else
        @stdnt= false
      end
    end
  end

  protected
  def common_method
    render layout: 'admin_layout'
  end


end
