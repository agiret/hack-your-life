class PagesController < ApplicationController
  # before_action :set_hack, only: [:home]
  skip_before_action :authenticate_user!, only: [:home]

  def home
    @hacks = Hack.all
    @votes = Vote.all
    # @hack_votes = hack_votes
  end

  private

  # def set_hack
  #   @hack = Hack.find(params[:id])
  # end

  def hack_votes(id)
    # @hack = Hack.find(params[:id])
    votes = @votes.select{ |vote| vote.hack_id == id }
  end

  def hack_params
    params.require(:hack).permit(:link, :vues, :user_id, :category_id)
  end


end
