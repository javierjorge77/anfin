class CreateConsultations < ActiveRecord::Migration[7.0]
  def change
    create_table :consultations do |t|
      t.string :rut
      t.string :nombre
      t.references :user, null: false, foreign_key: true

      t.timestamps
    end
  end
end
