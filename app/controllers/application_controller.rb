class ApplicationController < ActionController::Base
  helper :all
  protect_from_forgery

  def load_new_item
    @item = Item.new
  end

  def load_item
    @item = Item.find(params[:id])
  end

  def load_functions
    @functions = Function.order_by_name
  end
end
