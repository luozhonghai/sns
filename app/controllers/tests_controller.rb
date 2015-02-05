class TestsController < ApplicationController
  #get
  def show
    @info = Info.new(data: 1, comment: "test");
  end
  #post
  def update
    render :json => {info: 2, comment: "test2"}
  end
end
