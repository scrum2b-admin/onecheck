class InterviewController < ApplicationController
  before_filter :authenticate_user!, :only => [:new, :list, :edit_interview, :my_interviews, :delete]

  def new
    @interview = Interview.new
  end
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
      params[:interview][:questions].each do |key,value|
        @question=Question.parse(value,@interview.id)
        if @question.save
          value[:answers].each do |k,v|
          @answer = Answer.parse(v,@question.id)
          end
        end
      end
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
    @interview = Interview.find(params[:interview][:id])
    @interview.update_attributes(:title => params[:interview][:title],:start_date => params[:interview][:start_date],
                                 :due_date => params[:interview][:due_date], :time_test => params[:interview][:time_test])
    if params[:interview][:questions]
       params[:interview][:questions].each do |key,value|
         if value[:id]
           @question=Question.update(value)
           value[:answers].each do |k,v|
             if v[:id]
               @answer = Answer.update(v)
             else
               @answer = Answer.parse(v,value[:id])
             end
           end
         else
           if value[:content] != "" 
           @question=Question.parse(value,@interview.id)
             if @question.save
               value[:answers].each do |k,v|
                 if v[:content] != ""
                   @answer = Answer.parse(v,@question.id)
                 end
               end
             end
           end  
         end
       end
    end
    redirect_to :controller => "interview", :action => "show", :id => params[:interview][:id]
  end

end
