class ProfilesController < ApplicationController
    def index
      if params[:query].present?
        @users = User.ransack(name_cont: params[:query]).result(distinct: true)
      else
        @users = []
      end
  end
  def users
    query = User.ransack(name_cont: search_query)
    @users = query.result(distinct: true)
  end

  def search_query
    params[:query]    
  end
end
