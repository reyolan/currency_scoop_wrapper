class ConvertCurrencyController < ApplicationController
  def create
    redirect_to convert_currency_url(convert_currency_params)
  end

  def show
    @currency_conversion_data = CurrencyScoop::CurrencyConvertRequester.call(params[:from], params[:to],
                                                                             params[:amount])
  end

  private

  def convert_currency_params
    params.require(:convert_currency).permit(:from, :to, :amount)
  end
end
