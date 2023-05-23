class AttachImagesService
  def call
    find_attach_product
  end

  private

  def find_attach_product
    all_images_names.each do |image|
      product ||= Product.find_by(sku: "#{image.split('-').first}")
      attach_image(product, image) if product && !repeat_images?(product, image)
    end
  end

  def all_images_names
    images = Dir.foreach("./tmp/images/").select{ |x| File.basename("#{x}",".*") }
  end

  def attach_image(product, image)
    product.images.attach(
                          io: File.open("./tmp/images/#{image}"),
                          filename: "#{image}"
                          )
  end

  def repeat_images?(product, image)
    have_images ||= product.images.map{|img| img.filename}.join(' ').split.include?(image)
  end
end
