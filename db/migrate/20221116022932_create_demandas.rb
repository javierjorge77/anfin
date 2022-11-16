class CreateDemandas < ActiveRecord::Migration[7.0]
  def change
    create_table :demandas do |t|
      t.string :tipo
      t.string :estado
      t.string :estadoCausa
      t.string :etapa
      t.string :fechaingreso
      t.string :link
      t.string :linkPdf
      t.string :LinkEbook
      t.string :proc
      t.string :rol
      t.string :tribunal
      t.references :consultation, null: false, foreign_key: true

      t.timestamps
    end
  end
end
