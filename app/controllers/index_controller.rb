class IndexController < ApplicationController

  def index
      p(params)
      p(request.url)
      p(request.env['HTTP_REFERER'])
      p(request.query_string)
      @bikestole = BikeStole
        .all
        .page(params[:page])
      # if(params[:p]!="1")
      #   redirect_to("/?page="+params[:page]+"&p=1#search")
      # end

  end

  def test
    redirect_to("/?page="+params[:page]+"#search")
  end

end
