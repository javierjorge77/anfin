class ContactosController < ApplicationController

skip_before_action :authenticate_user!

  def new
    @contacto= Contacto.new

  end

  def create
    @contacto= Contacto.create(params)
  end

end
