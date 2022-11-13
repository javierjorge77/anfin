class AddReferencesToConsultation < ActiveRecord::Migration[7.0]
  def change
    add_reference :consultations, :user, null: false, foreign_key: true
  end
end