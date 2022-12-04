class CreateSuscriptions < ActiveRecord::Migration[7.0]
  def change
    create_table :suscriptions do |t|
      t.string :sku
      t.string :name

      t.timestamps
    end
  end
end
