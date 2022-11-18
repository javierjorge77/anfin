require "open-uri"
require "json"
require "http"



class ConsultationsController < ApplicationController

  def new
   @consultation= Consultation.new
  end

  def create
    @consultation = Consultation.new(consultation_params)
    @consultation.user = current_user
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
