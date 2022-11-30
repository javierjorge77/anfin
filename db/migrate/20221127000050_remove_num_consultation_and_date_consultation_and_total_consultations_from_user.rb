class RemoveNumConsultationAndDateConsultationAndTotalConsultationsFromUser < ActiveRecord::Migration[7.0]
  def change
    remove_column :users, :num_consultation, :integer
    remove_column :users, :date_consultation, :datetime
    remove_column :users, :total_consultations, :integer
  end
end
