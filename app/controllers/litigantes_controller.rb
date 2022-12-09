class LitigantesController < ApplicationController
def index
  @demanda = demanda.find(params[:id])
  @litigantes=@demanda.litigantes
end

end
