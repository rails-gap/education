class HomeController < ApplicationController
  layout :home_layout, only: [:index]

  def index
    @videos = Video.all.sample(3)
  end

  private

  def home_layout
    user_signed_in? ? 'application' : 'signout'
  end

end
