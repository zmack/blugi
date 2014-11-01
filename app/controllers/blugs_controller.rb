class BlugsController < ApplicationController
  def index
    @blugs = Blug.all
  end

  def new
    @blug = Blug.new
  end

  def show
    @blug = Blug.find_by_id(params[:id].to_i)
  end

  def create
    @blug = Blug.new(params[:blug])
    @blug.save

    redirect_to({ :action => :index })
  end
end


# https://github.com/zmack/hat_app
