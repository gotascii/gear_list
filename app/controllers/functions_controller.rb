class FunctionsController < ApplicationController
  before_filter :load_new_item, :only => [:show]
  before_filter :load_functions, :only => [:index, :show]

  def index
  end
end