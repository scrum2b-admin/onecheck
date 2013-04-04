class ApplyController < ApplicationController
  def apply_interview
    answer_true = []
    params[:interview][:answer].each do |key,answer|
      answer_true << answer[:is_correct] if Answer.correct?(answer[:is_correct])
    end
    @apply = Apply.new(:interview_id => params[:interview][:id], :user_id => current_user.id, :answer_true => answer_true.count)
    if @apply.save
      redirect_to "/"
    end
  end
end
