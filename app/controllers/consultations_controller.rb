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

          data["data"]["laboral"].each do |demanda|
            demanda = Demanda.create(
              consultation: @consultation,
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
              tribunal: "#{data["laboral"]["tribunal"]}"
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

        data["data"]["cobranza"] do |demanda|
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
            consultation: @consultation
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
