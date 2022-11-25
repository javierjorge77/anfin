class CreateContactos < ActiveRecord::Migration[7.0]
  def change
    create_table :contactos do |t|

      t.timestamps
    end
  end
end
