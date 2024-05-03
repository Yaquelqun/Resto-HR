class RestosController < ApplicationController

  def index
    @restos = Resto.all
  end

  def new
    @resto = Resto.new
  end
end