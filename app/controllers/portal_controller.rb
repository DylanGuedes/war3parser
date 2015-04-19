class PortalController < ApplicationController
  def index
    @news = News.all
    @replays = Replay.last(25)
  end

  def about
  end

  def help
  end
end
