class MiscController < ApplicationController
  def welcome
    @products_big_images = Product.with_big_image
  end

  def search
    if params[:q]
      @results = ThinkingSphinx.search(params[:q])
    else
      @results = []
    end
  end
end
