class UrlsController < ApplicationController
  def index
    @urls = Url.all
  end

  def show
    @url = Url.find(params[:id])
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(create_params)
    Urls::Create.call(@url)

    redirect_to root_path
  end

  private

  def create_params
    params.require(:url).permit(:original_url)
  end
end
