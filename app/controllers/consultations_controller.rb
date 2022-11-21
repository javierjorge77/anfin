require "open-uri"
require "json"
require "http"



class ConsultationsController < ApplicationController

  def new
   @consultation= Consultation.new
   @demanda= Demanda.new
  end


  def create
    @consultation= Consultation.new
    @demanda= Demanda.new
    conn = Faraday.new(
      url: 'https://api.sheriffqa.keiron.cl',
      headers: {   accept: "aplication/json",
        Authorization: ENV["KEY"]}
    )
    response = conn.get("/api/v1/integration/helper/judicial/#{consultation_params[:rut]}")
    data = JSON.parse(response.body)
      if data["success"]
        @consultation = Consultation.create(rut: "#{data["rut"]}", nombre: "pruebaq 1", user_id: current_user)
        @demanda.each do |demanda|
          demanda = Demanda.create(
            tipo: "civil",
            estado: "#{data["civil"]["estado"]}",
            estadoCausa: "#{data["civil"]["estadoCausa"]}",
            etapa: "#{data["civil"]["etapa"]}",
            fechaingreso:  "#{data["civil"]["fechaingreso"]}",
            link: "#{data["civil"]["link"]}",
            linkPdf:  "#{data["civil"]["linkPdf"]}",
            LinkEbook:"#{data["civil"]["linkEbook"]}",
            proc: "#{data["civil"]["proc"]}",
            rol: "#{data["civil"]["rol"]}",
            tribunal: "#{data["civil"]["tribunal"]}",
            consultation_id: @consultation.id
        )
      end

      @demanda.each do |demanda|
        demanda = Demanda.create(
          tipo: "laboral",
          estado: "#{data["laboral"]["estado"]}",
          estadoCausa: "#{data["laboral"]["estadoCausa"]}",
          etapa: "#{data["laboral"]["etapa"]}",
          fechaingreso:  "#{data["laboral"]["fechaingreso"]}",
          link: "#{data["laboral"]["link"]}",
          linkPdf:  "#{data["laboral"]["linkPdf"]}",
          LinkEbook:"#{data["laboral"]["linkEbook"]}",
          proc: "#{data["laboral"]["proc"]}",
          rol: "#{data["laboral"]["rol"]}",
          tribunal: "#{data["laboral"]["tribunal"]}",
          consultation_id: @consultation.id
      )
    end

    @demanda.each do |demanda|
      demanda = Demanda.create(
        tipo: "cobranza",
        estado: "#{data["cobranza"]["estado"]}",
        estadoCausa: "#{data["cobranza"]["estadoCausa"]}",
        etapa: "#{data["cobranza"]["etapa"]}",
        fechaingreso:  "#{data["cobranza"]["fechaingreso"]}",
        link: "#{data["cobranza"]["link"]}",
        linkPdf:  "#{data["cobranza"]["linkPdf"]}",
        LinkEbook:"#{data["cobranza"]["linkEbook"]}",
        proc: "#{data["cobranza"]["proc"]}",
        rol: "#{data["cobranza"]["rol"]}",
        tribunal: "#{data["cobranza"]["tribunal"]}",
        consultation_id: @consultation.id
    )
  end


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
