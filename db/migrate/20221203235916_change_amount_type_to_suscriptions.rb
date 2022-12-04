class ChangeAmountTypeToSuscriptions < ActiveRecord::Migration[7.0]
  def change
    rename_column(:orders, :amount, :price_cents)
    change_column(:orders, :price_cents, :string)

  end
end
