class ParticipationsController < ApplicationController

  def index
    @participations = current_user.participations.includes(:resto)
  end
end
