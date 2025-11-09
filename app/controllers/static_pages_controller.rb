require "dotenv"
require "pexels"

Dotenv.load

class StaticPagesController < ApplicationController
  def new
    secret_key = ENV["SECRET_KEY"]
    client = Pexels::Client.new(secret_key)
    begin
      @collection = client.collections.find(params["collection"]).media
    rescue Exception
      @collection = nil
    end
  end

  def create
    redirect_to controller: "static_pages", action: "new", collection: params[:query]
  end
end
