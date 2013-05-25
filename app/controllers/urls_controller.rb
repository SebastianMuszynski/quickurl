class UrlsController < ApplicationController
  respond_to :html

  def index
    @url = Url.new
  end

  def create
    @url = Url.create!(
      source: params[:url][:source],
      random_hash: Url.generate_random_hash
    )
  end

  def redirect
    @url = Url.where(random_hash: params[:random_hash]).first
    redirect_to @url.source
  end
end
