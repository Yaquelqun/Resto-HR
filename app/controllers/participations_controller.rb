class ParticipationsController < ApplicationController

  def index
    @participations = current_user.participations.includes(:resto)
  end

  def create
    Participation.create!(user_id: current_user.id, resto_id: params[:resto_id])
    flash[:success] = "Participation registered"
    redirect_to restos_path
  end

  def destroy
    Participation.find(params[:id]).destroy
    flash[:success] = "Participation successfully destroyed"
    redirect_to participations_path
  end
end
