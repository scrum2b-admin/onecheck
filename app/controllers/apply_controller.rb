class ApplyController < ApplicationController

  def apply_interview
    # @time_test = Interview.find(params[:interview][:id]).time_test
    # @time_tested = @time_test.to_f - params[:disp].to_f
# 
    # # Get the right answer params
    # answer_true = []
    # if params[:interview][:answer]
      # params[:interview][:answer].each do |key,answer|
        # answer_true << answer[:is_correct] if Answer.correct?(answer[:is_correct])
      # end
    # end

    # save the answers applied
    @apply = Apply.new(params[:apply])
    @apply.user_id = current_user.id
    if @apply.save
      redirect_to :controller => "interview",:action => "my_interviews"
    end
  end

end
