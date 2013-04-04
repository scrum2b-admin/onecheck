class QuestionController < ApplicationController

  def create
    # params[:interview][:questions].each do |key,value|
    # parse_qt(value,params[:interview])
    # end
    @interview = params[:interview]
   @interview.parse_qt(params[:interview])
    redirect_to :controller => "interview", :action => "show", :id => params[:interview][:id]
  end

  def delete
    @interview = Question.find(params[:id]).interview
    @questions = @interview.questions
    @question = Question.find(params[:id])
    if @question.destroy()
      respond_to do |format|
        format.js {
          @return_content = render_to_string(:partial => "/interview/list_questions",:locals => {:questions => @questions,:interview_id => @interview.id})
        }
      end
    end
  end
end
