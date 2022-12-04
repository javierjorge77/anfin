class AddPriceToSuscriptions < ActiveRecord::Migration[7.0]
  def change
    add_monetize :suscriptions, :price, currency: { present: false }
  end
end
