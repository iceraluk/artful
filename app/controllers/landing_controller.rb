class LandingController < ApplicationController

  def index
    @subscriber = Subscriber.new
  end
end
