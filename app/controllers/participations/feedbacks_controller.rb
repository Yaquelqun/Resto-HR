module Participations
  class FeedbacksController < ApplicationController
    def new
      @feedback = participation.feedbacks.new
    end

    def create
      @feedback = Feedback.new(
        participation_id: params[:participation_id],
        state: Feedback::INTENDED,
        **feedback_params
        )

      if @feedback.save
        flash[:success] = "Your feedback intent has been registered"
        redirect_to participations_path(@feedback.participation)
      else
        flash[:error] = "There was a problem saving the feedback infos"
        puts @feedback.errors.full_messages.to_sentence.capitalize
        render :new
      end
    end
    private

    def participation
      @participation ||= Participation.find(params[:participation_id])
    end

    def feedback_params
      @feedback_params ||= params.require(:feedback).permit(:target_id)
    end
  end
end