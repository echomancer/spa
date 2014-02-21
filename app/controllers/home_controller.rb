class HomeController < ApplicationController
  def index
    @users = User.all
    @stores = Store.all
  end
end
