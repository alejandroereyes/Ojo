class LookupsController < ApplicationController

  def show    
    url = Url.find_by(short_url: params[:code])

    redirect_to url.original_url, allow_other_host: true
  end
end