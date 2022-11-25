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
      @consultation = Consultation.create(rut: "#{data["data"]["rut"]}", nombre: "pruebaq 1", user: current_user)
        data["data"]["civil"].each do |civil|
        @demanda = Demanda.create(
            consultation: @consultation,
            tipo: "civil",
            estado: "#{civil["estado"]}",
            estadoCausa: "#{civil["estadoCausa"]}",
            etapa: "#{civil["etapa"]}",
            fechaingreso:  "#{civil["fechaingreso"]}",
            link: "#{civil["link"]}",
            linkPdf:  "#{civil["linkPdf"]}",
            LinkEbook:"#{civil["linkEbook"]}",
            proc: "#{civil["proc"]}",
            rol: "#{civil["rol"]}",
            tribunal: "#{civil["tribunal"]}"
          )
          civil["litigantes"].each do |litigante|
            @litigante = Litigante.create(
              demanda: @demanda,
              rut: "#{litigante["rut"]}",
              nombre: "#{litigante["nombre"]}",
              sujeto: "#{litigante["sujeto"]}",
              persona: "#{litigante["persona:"]}"
            )
          end
        end

          data["data"]["laboral"].each do |laboral|
            demanda = Demanda.create(
              consultation: @consultation,
              tipo: "laboral",
              estado: "#{laboral["estado"]}",
              estadoCausa: "#{laboral["estadoCausa"]}",
              etapa: "#{laboral["etapa"]}",
              fechaingreso:  "#{laboral["fechaingreso"]}",
              link: "#{laboral["link"]}",
              linkPdf:  "#{laboral["linkPdf"]}",
              LinkEbook:"#{laboral["linkEbook"]}",
              proc: "#{laboral["proc"]}",
              rol: "#{laboral["rol"]}",
              tribunal: "#{laboral["tribunal"]}"
          )
            laboral["litigantes"].each do |litigante|
              @litigante = Litigante.create(
                demanda: @demanda,
                rut: "#{litigante["rut"]}",
                nombre: "#{litigante["nombre"]}",
                sujeto: "#{litigante["sujeto"]}",
                persona: "#{litigante["persona:"]}"
              )
            end
        end

        data["data"]["cobranza"].each do |cobranza|
          demanda = Demanda.create(
            consultation: @consultation,
            tipo: "cobranza",
            estado: "#{cobranza["estado"]}",
            estadoCausa: "#{cobranza["estadoCausa"]}",
            etapa: "#{cobranza["etapa"]}",
            fechaingreso:  "#{cobranza["fechaingreso"]}",
            link: "#{cobranza["link"]}",
            linkPdf:  "#{cobranza["linkPdf"]}",
            LinkEbook:"#{cobranza["linkEbook"]}",
            proc: "#{cobranza["proc"]}",
            rol: "#{cobranza["rol"]}",
            tribunal: "#{cobranza["tribunal"]}"

        )
        cobranza["litigantes"].each do |litigante|
          @litigante = Litigante.create(
            demanda: @demanda,
            rut: "#{litigante["rut"]}",
            nombre: "#{litigante["nombre"]}",
            sujeto: "#{litigante["sujeto"]}",
            persona: "#{litigante["persona:"]}"
          )
        end
      end
   end
end

  def index
    @consultations= Consultation.all
  end

  def show
    @demandas= Demanda.all
  end


  private

  def consultation_params
    params.require(:consultation).permit(:rut, :id)
  end

end
