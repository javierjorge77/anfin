ActiveAdmin.register Consultation do

  # See permitted parameters documentation:
  # https://github.com/activeadmin/activeadmin/blob/master/docs/2-resource-customization.md#setting-up-strong-parameters
  #
  # Uncomment all parameters which should be permitted for assignment
  #
   permit_params :rut, :nombre, :user_id

  # Filters:
  filter :user_id, as: :select, collection: proc { User.all }
  filter :created_at

end
