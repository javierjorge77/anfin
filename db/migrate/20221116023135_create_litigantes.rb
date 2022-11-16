class CreateLitigantes < ActiveRecord::Migration[7.0]
  def change
    create_table :litigantes do |t|
      t.string :rut
      t.string :nombre
      t.string :sujeto
      t.string :persona
      t.references :demanda, null: false, foreign_key: true

      t.timestamps
    end
  end
end
