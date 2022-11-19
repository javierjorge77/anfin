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
    response = conn.get("/api/v1/integration/helper/judicial/#{consultation_params[:rut]}")
    data = JSON.parse(response.body)
      if data["success"]
        @consultation = Consultation.create(rut: "#{data["rut"]}", nombre: "Juan Camaney", user_id: current_user.id)
        @demanda.for each |demanda| do
        demanda = Demanda.create(
          tipo: "#{data["tipo"]}",
          estado: "#{data["estado"]}",
          estadoCausa: "#{data["estadoCausa"]}",
          etapa: "#{data["etapa"]}",
          fechaingreso:  "#{data["fechaingreso"]}",
          link: "#{data["link"]}",
          linkPdf:  "#{data["linkPdf"]}",
          LinkEbook:"#{data["linkEbook"]}",
          proc: "#{data["proc"]}",
          rol: "#{data["rol"]}",
          tribunal: "#{data["tribunal"]}",
          consultation_id: @consultation.id
        )
      end
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
