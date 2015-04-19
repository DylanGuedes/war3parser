class PortalController < ApplicationController
  def index
    @news = News.all
    @replays = Replay.all
  end

  def about
  end

  def help
  end
end
