class AddDataToLitigante < ActiveRecord::Migration[7.0]
  def change
    add_column :litigantes, :rut, :string
    add_column :litigantes, :nombre, :string
    add_column :litigantes, :sujeto, :string
    add_column :litigantes, :persona, :string
    add_reference :litigantes, :demanda, null: false, foreign_key: true
  end
end
