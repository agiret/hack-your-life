class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @hacks = Hack.all
  end
end
