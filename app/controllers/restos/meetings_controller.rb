module Restos
  class MeetingsController < ApplicationController

    def create
      resto = Resto.find(params[:resto_id])
      flash[:notice] = "Meeting created!"
      redirect_to resto_path(resto)
    end
  end
end
