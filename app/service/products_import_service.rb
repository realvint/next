class ProductsImportService
  attr_accessor :updated, :created, :errors

  def initialize(file)
    self.updated = []
    self.created = []
    self.errors  = []

    book  = RubyXL::Parser.parse file.path
    sheet = book.worksheets.first
    sheet.each_with_index do |row, index|
      next unless index.positive? && row && row.cells.present?

      data = {
        barcode: row.cells[0].try(:value),
        sku: row.cells[1].try(:value),
        title: row.cells[2].try(:value)
      }

      import_product data.map { |k, v| [k, v != Product::EMPTY ? v : nil] }.to_h
    end
  end

  def import_product(data)
    product = Product.find_by barcode: data[:barcode]

    if product
      update_product product, data
    elsif data[:title].present?
      create_product data
    end
  end

  def update_product(product, data)
    populate_product product, data

    if product.changed?
      if product.save
        updated << product.id
      else
        errors << product
      end
    end
  end

  def create_product(data)
    product = Product.new

    populate_product product, data
    if product.save
      created << product.id
    else
      errors << product
    end
  end

  def populate_product(product, data)
    product.barcode                = data[:barcode] if data[:barcode].present?
    product.sku                    = data[:sku] if data[:sku].present?
    product.title                  = data[:title]

    product
  end
end
