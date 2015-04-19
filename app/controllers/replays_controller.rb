class ReplaysController < ApplicationController
  def index
    @replays = Replay.all
    @replay = Replay.new
  end

  def show
    @replay = Replay.find(params[:id])
  end

  def create
    @replay = Replay.new(replay_params)
    @replay.user = current_user
    if @replay.save
      redirect_to @replay
    else
      @replays = Replay.all
      render 'index'
    end
  end

  def update
    @replay = Replay.new(replay_params)
    @replay.user = current_user
    if @replay.save
      redirect_to @replay
    else
      @replays = Replay.all
      render 'index'
    end
  end

  private
  def replay_params
    params.require(:replay).permit(:replay_file, :description, :file_name, :user_id)
  end
end
