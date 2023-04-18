class Counterparty < ApplicationRecord
  validates :name, presence: true
  validates :phone, presence: true, uniqueness: true

  def self.to_json(id)
    Counterparty.where(id:).map { |u| { text: u.name, value: u.id, phone: u.phone } }
  end

  def self.ransackable_attributes(auth_object = nil)
    %w[name phone]
  end

  def self.ransackable_associations(auth_object = nil)
    %w[audits orders receipt_orders retail_orders]
  end
end
