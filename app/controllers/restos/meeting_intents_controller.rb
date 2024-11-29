module Restos
  class MeetingIntentsController < ApplicationController
    def new
      @meeting_intent = resto.meeting_intents.new(initiator_id: current_user.id)
      @possible_targets = resto.users.where.not(id: [current_user.id] + resto.meeting_intents.where(initiator_id: current_user.id).pluck(:target_id))
    end

    def create
      @meeting_intent = MeetingIntent.new(
        resto_id: params[:resto_id],
        initiator_id: current_user.id,
        **meeting_intent_params
      )

      if @meeting_intent.save
        flash[:success] = "Your meeting_intent intent has been registered"
        redirect_to restos_path
      else
        flash[:error] = "There was a problem saving the meeting_intent infos"
        puts @meeting_intent.errors.full_messages.to_sentence.capitalize
        render :new
      end
    end
    private

    def resto
      @resto ||= Resto.find(params[:resto_id])
    end

    def meeting_intent_params
      @meeting_intent_params ||= params.require(:meeting_intent).permit(:target_id)
    end
  end
end