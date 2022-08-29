class SearchController < ApplicationController
  def index
    @user=User.all()
    @q = User.ransack(params[:q])
    @user = @q.result(distinct: true)
  end
end
