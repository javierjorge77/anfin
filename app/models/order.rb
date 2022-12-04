class Order < ApplicationRecord
  belongs_to :user
  belongs_to :suscription

  monetize :price_cents


end
