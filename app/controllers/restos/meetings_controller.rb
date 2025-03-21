module Restos
  class MeetingsController < ApplicationController

    def create
      resto = Resto.find(params[:id])
      fail!
      redirect_to resto_path(resto)
    end
  end
end
