class ContactosController < ApplicationController


  def new
    @contacto= Contacto.new

  end

  def create
    @contacto= Contacto.create


  end

end
