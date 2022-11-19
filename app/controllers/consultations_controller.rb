require "open-uri"
require "json"
require "http"



class ConsultationsController < ApplicationController

  def new
   @consultation= Consultation.new
  end

  def create
    conn = Faraday.new(
      url: 'https://api.sheriffqa.keiron.cl',
      headers: {   accept: "aplication/json",
        Authorization: ENV["KEY"]}
    )

    response = conn.get('/api/v1/integration/helper/judicial/12470886-9')
    data = JSON.parse(response.body)
      if data["success"]
        @consultation = Consultation.create(rut: "#{data["rut"]}", nombre: "Juan Camaney", user_id: current_user.id, created_at: Date.today, updated_at: Date.today )

  end

  def index
    @consultations= Consultation.all
  end

  def show
    @consultation= Consultation.find(params[:id])
  end


  private

  def consultation_params
    params.require(:consultation).permit(:rut, :id)
  end

end
