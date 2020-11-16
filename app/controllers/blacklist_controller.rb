class BlacklistController < ApplicationController
  def new
    if current_user.role_id <= 1
      redirect_to root_path
    end
    @blacklist = Blacklist.new
    @blacklists = Blacklist.all
  end

  def create
    @blacklist = Blacklist.new(blacklist_params)
    if @blacklist.save
      redirect_to new_blacklist_path
    else
      redirect_to root_path
    end
  end

  private
  def blacklist_params
    params.require(:blacklist).permit(:word, :flag)
  end
end