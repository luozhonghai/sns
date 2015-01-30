class TestsController < ApplicationController
  #get
  def show
    @info = Info.new(data: 1, comment: "test");
  end
  #post
  def update
    render :json => {info: params[:info][:data], comment: params[:info][:comment]}
  end
end
