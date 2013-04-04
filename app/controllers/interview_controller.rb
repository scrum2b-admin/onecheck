class InterviewController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :list, :edit_interview, :my_interviews, :delete]

  before_filter :check_interview, :only => [:create,:new]
  def show
    @interview = Interview.find(params[:id])
    @questions = @interview.questions
  end

  def my_interviews
    @my_applied_interviews = Apply.where(:user_id => current_user.id)
  end

  def create
    @interview = Interview.parse(params[:interview],current_user.id)
    if @interview.save
    Rails.logger.info "params_id #{@interview.id}"
    params[:interview].merge!(:id => @interview.id)
    @question= Question.parse(params[:interview])
    #params[:interview][:questions].merge!(:question_id => @question.id)
    #@answer = Answer.parse(params[:interview][:questions])
    end
    redirect_to "/"
  end

  def delete
    @inprogress_interview = Interview.where("start_date <= ?",Time.zone.now.to_date)
    @interview = Interview.find(params[:id])
      if @interview.destroy()
        respond_to do |format|
          format.js {
            @return_content = render_to_string(:partial => "/home/body_inprogress_interviews",:locals => {:inprogress_interview => @inprogress_interview})
          }
        end
      end
  end

  def edit
    @interview = Interview.find(params[:id])
    @questions = @interview.questions
  end

  def update
    @question = Question.new
    @interview = Interview.find(params[:interview][:id])
    @interview.update_attributes(:title => params[:interview][:title],:start_date => params[:interview][:start_date],
    :due_date => params[:interview][:due_date], :time_test => params[:interview][:time_test])
    if params[:interview][:questions]
      params[:interview][:questions].each do |key,value|
        @question.create_questions_on_edit(value,)
      end
    end
    if @interview.valid?
      redirect_to :controller => "interview", :action => "show", :id => params[:interview][:id]
    else
      redirect_to :controller => "interview", :action => "edit", :id => params[:interview][:id]
    end
  end

  def check_interview
    @interview = Interview.new
    @question = Question.new
    @answer = Answer.new
  end

end
