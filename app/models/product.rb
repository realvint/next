class Product < ApplicationRecord
  DEFAULT_BARCODE = 2_000_000_200_000
  DEFAULT_SKU = 12_000

  has_many_attached :images

  after_create do
    update!(barcode: (DEFAULT_BARCODE + id)) if barcode.blank?
    update!(sku: (DEFAULT_SKU + id)) if sku.blank?
  end

  EMPTY = 'Не указано'.freeze

  validates :title, presence: true, uniqueness: true

  scope :filter_by_sku, -> (sku) { where('sku LIKE ?', "%#{sku}%") }

  def self.ransackable_attributes(auth_object = nil)
    %w[barcode sku title]
  end

  def self.ransackable_associations(auth_object = nil)
    []
  end

  def add_images(image:)
    images.attach(image)
  end
end
