class CreateLitigantes < ActiveRecord::Migration[7.0]
  def change
    create_table :litigantes do |t|

      t.timestamps
    end
  end
end
