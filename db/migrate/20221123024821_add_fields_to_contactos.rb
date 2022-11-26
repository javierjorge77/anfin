class AddFieldsToContactos < ActiveRecord::Migration[7.0]
  def change
    add_column :contactos, :name, :string
    add_column :contactos, :email, :string
    add_column :contactos, :text, :string
  end
end
