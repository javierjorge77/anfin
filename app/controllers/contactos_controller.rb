class ContactosController < ApplicationController

skip_before_action :authenticate_user!

  def new
    @contacto = Contacto.new


  end

  def create
    @contacto= Contacto.create(contacto_params)
    redirect_to root_path

  end

private

  def contacto_params
    params.require(:contacto).permit(:name, :email, :text)
  end


end
