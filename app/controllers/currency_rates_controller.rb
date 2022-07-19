class CurrencyRatesController < ApplicationController
  def index
    @currency_rates_data = CurrencyScoop::CurrencyRatesRequester.call(params[:base], params[:symbols])
  end

  def create
    redirect_to currency_rates_url(currency_rate_params)
  end

  private

  def currency_rate_params
    currency_params = params.require(:currency_rate).permit(:base, :symbols)
    currency_params.delete_if { |_, value| value.blank? }
  end
end
