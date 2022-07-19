class ConvertCurrencyController < ApplicationController
  def new
  end

  def create
  end
  
  def show
    @convert_currency_result = CurrencyScoop::CurrencyConverterRequester.call(from_currency_code: params[:from],
                                                                              to_currency_code: params[:to],
                                                                              amount: params[:amount])
  end
end
