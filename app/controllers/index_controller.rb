class IndexController < ApplicationController
  def index
      @bikestole = BikeStole
        .all
        .page(params[:page])
  end
end
