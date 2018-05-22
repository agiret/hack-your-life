class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @hacks = Hack.all
    @hack_votes = @votes.select{ |vote| vote.hack_id == @hack } # synthaxe à trouver...
  end
end
