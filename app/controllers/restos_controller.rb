class RestosController < ApplicationController

  def index
    @restos = Resto.all
  end
end