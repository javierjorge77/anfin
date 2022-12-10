class SuscriptionsController < ApplicationController
  skip_before_action :authenticate_user!

def index
  @suscriptions = policy_scope(Suscription)
  @suscriptions = Suscription.all
  authorize @suscriptions
end

def show
  @suscription = Suscription.find(params[:id])
  authorize @suscription


end

end
