class ItemsController < ApplicationController
  before_filter :load_new_item, :only => [:index, :new]
  before_filter :load_item, :only => [:destroy, :update, :edit]
  before_filter :load_functions, :only => [:index, :new, :edit]
  before_filter :load_items, :only => [:index]

  def index
  end

  def new
  end

  def create
    @item = Item.create(item_params)
    respond_to do |format|
      format.html { redirect_to items_url }
      format.js { load_items }
    end
  end

  def update
    @item.update_attributes(item_params)
    respond_to do |format|
      format.html { redirect_to items_url }
      format.js do
        render js: "window.location = '#{items_url(:function_id => params[:function_id])}';"
      end
    end
  end

  def destroy
    @item.delete
    redirect_to items_url(:function_id => params[:function_id])
  end

  private
  def load_items
    if params[:function_id].blank?
      @items = Item.order_by_function_name
    else
      function = Function.find(params[:function_id])
      @items = function.items.order_by_function_name
    end
  end

  def item_params
    params[:item].permit!
  end
end
