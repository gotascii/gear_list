class ListsController < ApplicationController
  def index
    @list = List.new
    @lists = List.order_by_name
  end

  def show
    @list = List.find(params[:id])
    @items = Item.order_by_function_name
    @picks = @list.picks.order_by_item_function_name
    @pick = Pick.new(:list => @list)
  end

  def create
    @list = List.create!(params[:list])
    redirect_to lists_url
  end
end