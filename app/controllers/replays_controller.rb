class ReplaysController < ApplicationController
  def index
    @replays = Replay.all
  end

  def show
    @replay = Replay.find(params[:id])
  end
end
