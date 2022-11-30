ActiveAdmin.register Demanda do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
  # permit_params :tipo, :estado, :estadoCausa, :etapa, :fechaingreso, :link, :linkPdf, :LinkEbook, :proc, :rol, :tribunal, :consultation_id
  #
  # or
  #
  # permit_params do
  #   permitted = [:tipo, :estado, :estadoCausa, :etapa, :fechaingreso, :link, :linkPdf, :LinkEbook, :proc, :rol, :tribunal, :consultation_id]
  #   permitted << :other if params[:action] == 'create' && current_user.admin?
  #   permitted
  # end

      # Filters:
      filter :consultation, as: :select, collection: proc { Consultation.all }


end
