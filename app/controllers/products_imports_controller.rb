class ProductsImportsController < ApplicationController
  def create
    import = ProductsImportService.new params[:file]

    render :new, locals: { import: import }
  rescue StandardError => e
    logger.error e.message
    logger.error e.backtrace.join("\n")

    render :new, locals: { error: true }
  end
end
