class RestosController < ApplicationController

  def index
    @restos = Resto.all
  end

  def new
    @resto = Resto.new
  end

  def show
    @resto = Resto.includes([:participations, :users, meetings: [meeting_users: :user]]).find(params[:id])
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
      redirect_to restos_path
    else
      render :edit, status: :unprocessable_entity, notice: "There was a problem saving the resto"
    end
  end

  def destroy
    @resto = Resto.find(params[:id])

    if @resto.destroy
      respond_to do |format|
        format.html { redirect_to restos_path, notice: "resto was destroyed" }
        format.turbo_stream
      end
    else
      redirect_to restos_path, status: :unprocessable_entity, notice: "There was a problem destroying the resto"
    end
  end

  private

  def resto_params
    @resto_params ||= params.require(:resto).permit(:date)
  end
end