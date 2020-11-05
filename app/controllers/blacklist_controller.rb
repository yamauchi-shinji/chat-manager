class BlacklistController < ApplicationController
  def new
    @blacklist = Blacklist.new
    @blacklists = Blacklist.all
  end

  def show
    @blacklists = Blacklist.all
  end

  def create
    @blacklist = Blacklist.new(blacklist_params)
    if @blacklist.save
    end
  end

  private
  def blacklist_params
    params.require(:blacklist).permit(:word, :flag)
  end
end
