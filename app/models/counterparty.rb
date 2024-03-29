class Counterparty < ApplicationRecord
  has_many :phones, dependent: :destroy, inverse_of: :counterparty
  accepts_nested_attributes_for :phones, reject_if: :all_blank, allow_destroy: true

  validates :name, presence: true
  validates :phone, presence: true, uniqueness: true, phone: true

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
