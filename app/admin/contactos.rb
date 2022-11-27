ActiveAdmin.register Contacto do

   permit_params :name, :email, :text

   index do
    selectable_column
    column :name
    column :email
    column :text
    actions
  end

    # Filters:
    filter :email, label: 'Username' , as: :select, collection: proc { Contacto.all }


end
