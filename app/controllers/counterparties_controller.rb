class CounterpartiesController < ApplicationController
  before_action :set_counterparty, only: %i[show edit update destroy]

  def index
    filtered = Counterparty.ransack(name_or_phone_has_every_term: params[:q])
    @pagy, @counterparties = pagy(filtered.result(distinct: true).order(:name), items: 25)
  end

  def show; end

  def new
    @counterparty = Counterparty.new
  end

  def create
    @counterparty = Counterparty.new(counterparty_params)

    respond_to do |format|
      if @counterparty.save
        flash.now[:notice] = t('.created')

        format.turbo_stream
        format.html { redirect_to counterparties_path, notice: t('.created') }
      else
        render_turbo_stream_error

        format.turbo_stream
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end

  def edit
    @source = params[:source]
  end

  def update
    respond_to do |format|
      if @counterparty.update(counterparty_params)
        flash.now[:notice] = t('.updated')
        format.turbo_stream
        format.html { redirect_to counterparties_path, notice: t('.updated') }
      else
        render_turbo_stream_error
        format.turbo_stream
        format.html { render :edit, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @counterparty.destroy
    flash.now[:notice] = t('.deleted')

    respond_to do |format|
      format.turbo_stream do
        render turbo_stream: [
          turbo_stream.remove(@counterparty),
          prepend_flash
        ]
      end
      format.html { redirect_to counterparties_path, notice: t('.deleted') }
    end
  end

  def autocomplete
    list = Counterparty.order(:name)
                       .where('phone like :q', q: "%#{params[:q]}%")

    render json: list.map { |u| { text: u.name, value: u.id, phone: u.phone } }
  end

  private

  def set_counterparty
    @counterparty = Counterparty.find(params[:id])
  end

  def counterparty_params
    params.require(:counterparty).permit(:name, :phone)
  end

  def render_turbo_stream_error
    flash.now[:alert] = @counterparty.errors.full_messages.join('; ')
  end
end
