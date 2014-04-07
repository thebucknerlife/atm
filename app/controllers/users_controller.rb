class UsersController < ApplicationController

  caches_action :matches, cache_path: proc {|c|
    match = User.find(params[:id]).hosting_matches.order('updated_at DESC').limit(1).first
    {:tag => match.updated_at.to_i}
  }

  def index
    render json: { users: User.all }
  end

  def new
    user = User.new(user_params)
    if user.save
      render json: user
    else
      render json: {errors: user.errors }, status: 400
    end
  end

  def matches
    user = User.find(params[:id])
    render json: { user: user.as_json.merge(matches: user.hosting_matches) }
  end

  def pay
    if FirebaseWorker.perform_async(params[:payor], params[:payee], params[:cool])
      render json: { success: true }, status: 200
    else
      render json: { success: false }, status: 420
    end
  end

private

  def user_params 
    params.require(:user).permit(:name)
  end
end