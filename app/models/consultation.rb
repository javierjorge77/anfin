class Consultation < ApplicationRecord
  belongs_to :user
  has_many :demandas
end
