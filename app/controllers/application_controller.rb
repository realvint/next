class ApplicationController < ActionController::Base
  include Pagy::Backend

  def prepend_flash
    turbo_stream.prepend(:flash, partial: 'shared/flash')
  end
  helper_method :prepend_flash
end
