class PicksController < ApplicationController
  def create
    @pick = Pick.create!(params[:pick])
    redirect_to_list_url
  end

  def destroy
    @pick = Pick.find(params[:id])
    @pick.delete
    redirect_to_list_url
  end

  private
  def redirect_to_list_url
    redirect_to list_url(@pick.list)
  end
end