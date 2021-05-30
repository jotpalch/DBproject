class IndexController < ApplicationController

  def index
      @bikestole = BikeStole
        .all
        .page(params[:page])
  end

  def test
    redirect_to("/?page="+params[:page]+"#search")
  end

end
