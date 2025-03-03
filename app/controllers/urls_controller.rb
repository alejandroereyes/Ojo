class UrlsController < ApplicationController
  before_action :authenticate_user!

  def index
    @urls = Url.where(user_id: current_user.id)

    respond_to do |format|
      format.html {  }
      format.turbo_stream
    end
  end

  def show
    @url = Url.where(id: current_user.id).find(params[:id])
  end

  def new
    @url = Url.new
  end

  def create
    @url = Url.new(create_params)
    @url.user = current_user
    Urls::Create.call(@url)

    redirect_to new_url_path
  end

  private

  def create_params
    params.require(:url).permit(:original_url)
  end
end
