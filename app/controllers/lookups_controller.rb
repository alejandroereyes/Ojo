class LookupsController < ApplicationController
  before_action :set_url

  def show
    respond_to do |format|
      format.html do
        redirect_to @url.original_url, allow_other_host: true
      end
    end
  end

  private

  def set_url
    @url = Url.find_by(short_url: params[:short_code])
  end
end
