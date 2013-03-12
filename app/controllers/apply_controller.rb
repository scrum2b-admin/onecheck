class ApplyController < ApplicationController
  def apply_interview
     @inprogress_interview = Interview.where("start_date <= ?",Time.zone.now.to_date)
     @apply = Apply.new(:interview_id => params[:interview_id], :user_id => current_user.id)
     Rails.logger.info "TTTTTTTT #{params[:interview_id]}"
     if @apply.save
       respond_to do |format|
        format.js {
          @return_content = render_to_string(:partial => "/home/body_inprogress_interviews",:locals => {:inprogress_interview => @inprogress_interview})
        }
        end
     end
     Rails.logger.info "TTTTTTTT #{@return_content}" 
  end
end
