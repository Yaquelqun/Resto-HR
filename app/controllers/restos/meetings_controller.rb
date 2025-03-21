module Restos
  class MeetingsController < ApplicationController

    def create
      resto = Resto.find(params[:resto_id])
      flash[:notice] = "Meeting created!"

      case CreateMeetings.new(resto_id: params[:resto_id]).call
      in { status: :success, success_message: success_message, response: _}
        flash[:notice] = success_message
      in { status: status, error_message: error_message, response: _}
        flash[:alert] = error_message
      else
        flash[:alert] = "Something went wrong"
      end
      redirect_to resto_path(resto)
    end
  end
end
