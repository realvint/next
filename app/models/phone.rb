class Phone < ApplicationRecord
  belongs_to :counterparty

  validates :value, presence: true, uniqueness: true, phone: true
end
