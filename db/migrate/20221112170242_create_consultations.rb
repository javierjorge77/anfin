class CreateConsultations < ActiveRecord::Migration[7.0]
  def change
    create_table :consultations do |t|
      t.string :rut
      t.string :nombre
      t.string :laboral
      t.string :civil
      t.string :cobranza
      t.string :otras
      t.string :estado
      t.string :estadoCausa
      t.string :etapa
      t.string :fechaIngreso
      t.string :link
      t.string :linkPdf
      t.string :linkEbook
      t.string :litigantes
      t.string :rutLitigante
      t.string :sujetoLitigante
      t.string :personaLitigante
      t.string :proc
      t.string :rol
      t.string :tribunal

      t.timestamps
    end
  end
end
