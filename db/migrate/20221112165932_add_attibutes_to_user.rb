class AddAttibutesToUser < ActiveRecord::Migration[7.0]
  def change
    add_column :users, :username, :string
    add_column :users, :creation_date, :datetime
    add_column :users, :num_consultation, :integer
    add_column :users, :date_consultation, :datetime
    add_column :users, :contract, :boolean
    add_column :users, :total_consultations, :integer
  end
end
