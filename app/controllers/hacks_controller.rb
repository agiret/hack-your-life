class HacksController < ApplicationController

  skip_before_action :authenticate_user!, only: [:upvote]
  before_action :set_hack!, except: [:new, :index, :create]

  # POST /hacks/:hack_id/upvote
  def upvote
    # @vote = @hack.votes.new(user: current_user)
    @vote = Vote.new(user: current_user)
    @vote.hack = @hack
    if @vote.save
      redirect_to root_path, success: 'Vote created'
    else
      redirect_to root_path, error: 'Vote could not be created'
    end
  end

  # POST /hacks/:hack_id/downvote
  def downvote
    @vote = @hack.votes.where(user: current_user).first!
    @vote.destroy
    redirect_to root_path, success: 'Vote deleted'
  end


  private

  def vote_params
    params.require(:vote).permit(:hack_id, :user_id)
  end

  # this will raise ActiveRecord::RecordNotFound if
  # the id or hack_id param is not valid. This triggers a 404 response
  def set_hack!
    if params[:id].present?
      @hack = Hack.find(params[:id])
    else
      @hack = Hack.find(params[:hack_id])
    end
  end
end
