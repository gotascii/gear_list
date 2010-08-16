class ListsController < ApplicationController
  before_filter :load_list, :only => [:show, :edit, :update, :destroy]
  before_filter :load_lists, :only => [:index, :edit]

  def index
    @list = List.new
  end

  def show
    @items = Item.order_by_function_name
    @picks = @list.picks.order_by_item_function_name
    @pick = Pick.new(:list => @list)
  end

  def create
    @list = List.create!(params[:list])
    redirect_to lists_url
  end

  def edit
  end

  def update
    @list.update_attributes(params[:list])
    redirect_to lists_url
  end

  def destroy
    @list.delete
    redirect_to lists_url
  end

  private
  def load_list
    @list = List.find(params[:id])
  end

  def load_lists
    @lists = List.order_by_name
  end
end