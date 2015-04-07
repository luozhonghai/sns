class TestsController < ApplicationController
  #get
  def show
    @info = Info.new(data: 1, comment: "test")

    $redis.publish 'rt-change', @info.to_json
  end
  #post
  def update
    @info = Info.new(data: 1, comment: "test")
    render json: @info
  end
end
