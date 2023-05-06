class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy add_elso_image destroy_attachment_image]

  def index
    @q = Product.order(title: :asc).ransack(params[:q])
    @pagy, @products = pagy(@q.result)

    return unless params[:q].present? && params.dig(:q, :title_or_sku_has_every_term) [/^\d+$/]

    code = params.dig(:q, :title_or_sku_has_every_term)
    @products = Product.where(barcode: code) if code.size == 13
  end

  def show
    @images = @product.images
  end

  def new
    @product = Product.new
  end

  def create
    @product = Product.new(product_params)
    if @product.save
      redirect_to @product, notice: 'Товар создан'
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit; end

  def update
    if @product.update(product_params)
      redirect_to @product, notice: 'Товар обновлён'
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    if @product.in_stock.positive?
      redirect_to products_path, alert: 'Нельзя удалить товар в налчии'
    else
      @product.destroy
      redirect_to products_path, notice: 'Товар удалён'
    end
  end

  def export
    @products = Product.available.order(title: :asc)
    render xlsx: "All_products_#{Time.current.strftime('%d-%m-%Y_%H-%M')}", template: 'products/export'
  end

  def add_elso_image
    @product.add_images(image: params[:images])
  end

  def destroy_attachment_image
    image = ActiveStorage::Attachment.find(params[:id])
    image.purge
    redirect_back(fallback_location: @product)
  end

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title, images:[])
  end
end
