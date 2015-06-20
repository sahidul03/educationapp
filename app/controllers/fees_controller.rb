class FeesController < ApplicationController
  def new
    @fee=Fee.new
    @last_updated_fee=Fee.last
    render layout: 'admin_layout'
  end
  def create
    @fee=Fee.new(fee_params)
    if @fee.save
      flash[:notice] = "Fees Added Successfully"
      redirect_to new_fee_path
    else
      flash[:notice] = "Eroor: Please fill the form correctly "
      redirect_to new_fee_path
    end
  end

  def load_class_wise_fees
    date=DateTime.now
    year=AccountYear.where(:name=>date.strftime("%Y"))
    month=Month.where(:name => date.strftime("%B"))
    fees=Fee.where(:level_id =>params[:level_id],:account_year_id=>year.last.id,:month_id => month.last.id)
    @fee=fees.last if fees.any?
  end

  protected
  def fee_params
    params.require(:fee).permit(:monthly_fee, :session_fee, :admission_fee, :ict_fee, :exam_fee, :others, :comment).
        merge(:level_id=> params[:select_level],:month_id=>params[:select_month],:account_year_id=>params[:select_year])
  end
end
