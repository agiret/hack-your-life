class HacksController < ApplicationController

  skip_before_action :authenticate_user!, only: [:upvote]

  def upvote
    # @vote = Vote.new(vote_params)
    @vote = Vote.new(hack_id: params[:id])  # fonctionne mais pas le @vote.save après...
    @hack = Hack.find(params[:id])
    # raise
    @vote.hack = @hack
    # @hack.votes.create

    if @vote.save
      redirect_to root_path
    else
      p 'Problème de @vote.save !'
      # render :new
    end
  end

  private

  def vote_params
    params.require(:vote).permit(:hack_id)
  end
end
