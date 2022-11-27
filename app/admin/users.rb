ActiveAdmin.register User do

  # Show
    index do
      selectable_column
      column :id
      column :email
      column :username
      column :created_at
      column :admin
      actions
    end
  # See permitted parameters documentation:

   permit_params :email, :encrypted_password, :reset_password_token, :reset_password_sent_at, :remember_created_at, :username, :creation_date, :num_consultation, :date_consultation, :contract, :total_consultations, :admin

    # New User
    form do |f|
      f.inputs "Identity" do
        f.input :username
        f.input :email
      end
      f.inputs "Admin" do
        f.input :admin
      end
      f.actions
    end

    # Filters:
    filter :username, as: :select, collection: proc { User.all }




end
