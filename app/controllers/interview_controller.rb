class InterviewController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :list]
  def new
  @interview = Interview.new
  end
  def show
    @interview = Interview.find(params[:id])
    @questions = @interview.questions
  end
  def my_interviews
    @my_applied_interviews = Apply.where(:user_id => current_user.id)
    Rails.logger.info "test #{@my_applied_interviews}"
  end
  def create
    @interview = Interview.new(:title => params[:interview][:title],:start_date => params[:interview][:start_date],:user_id => current_user.id, 
                               :due_date => params[:interview][:due_date], :time_test => params[:interview][:time_test])
    if @interview.save
       params[:interview][:questions].each do |key,value|
           @interview.create_questions(value,@interview.id)
       end
        redirect_to "/" 
    else
      redirect_to '/interview/new'
    end
  end
  def delete
     @inprogress_interview = Interview.where("start_date <= ?",Time.zone.now.to_date)
     @interview = Interview.find(params[:interview_id])
     if @interview.destroy()
       respond_to do |format|
        format.js {
          @return_content = render_to_string(:partial => "/home/body_inprogress_interviews",:locals => {:inprogress_interview => @inprogress_interview})
        }
        end
     end
  end
  def edit_interview
    @interview = Interview.find(params[:interview_id])
    Rails.logger.info "test : #{@interview}"
  end
end
