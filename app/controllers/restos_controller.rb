class RestosController < ApplicationController

  def index
    @restos = Resto.all
  end

  def new
    @resto = Resto.new
  end

  def show
    @resto = Resto.includes([:participations, :users]).find(params[:id])
  end

  def create
    @resto = Resto.new(resto_params)
    if @resto.save
      respond_to do |format|
        format.html { redirect_to restos_path, notice: "New Resto successfully planned for the #{@resto.date}" }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity, notice: "There was a problem saving the resto"
    end
  end

  def edit
    @resto = Resto.find(params[:id])
  end


  def update
    @resto = Resto.find(params[:id])
    if @resto.update(resto_params)
      flash[:success] = "Resto successfully updated for the #{@resto.date}"
      redirect_to restos_path
    else
      flash[:error] = "There was a problem saving the resto"
      render :edit
    end
  end

  def destroy
    resto = Resto.find(params[:id])

    if resto.destroy
      flash[:success] = "Resto for the #{resto.date} successfully destroyed"
      redirect_to restos_path
    else
      flash[:error] = "There was a problem destroying the resto"
      redirect_to restos_path
    end
  end

  private

  def resto_params
    @resto_params ||= params.require(:resto).permit(:date)
  end
end