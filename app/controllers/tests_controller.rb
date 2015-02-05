class TestsController < ApplicationController
  #get
  def show
    @info = Info.new(data: 1, comment: "test")
  end
  #post
  def update
    @info = Info.new(data: 1, comment: "test")
    render json: @info
  end
end
