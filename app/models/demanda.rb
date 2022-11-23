class Demanda < ApplicationRecord
  belongs_to :consultation
  has_many :litigantes
end
