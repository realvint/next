class ProductsController < ApplicationController
  before_action :set_product, only: %i[show edit update destroy]

  def index
    @products = params[:q].present?  ? @products = Product.search_products(params[:q]) : Product.all
    @pagy, @products = pagy(@products, items: 25)
  end

  def show
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

  private

  def set_product
    @product = Product.find(params[:id])
  end

  def product_params
    params.require(:product).permit(:title)
  end
end
