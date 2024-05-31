module Restos
  class MatchingsController < ApplicationController

    def create
      resto = Resto.find(params[:id])
      CreateMatchings.new(resto: resto).call

      flash[:success] = "matching created for resto #{resto.code_name}"
      redirect_to resto_path(resto)
    end
  end
end
