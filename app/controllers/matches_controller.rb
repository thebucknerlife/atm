class MatchesController < ApplicationController

  def index
    render json: Match.all
  end

end