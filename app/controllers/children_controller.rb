class ChildrenController < ApplicationController

  def index
    @children = Child.all
  end

  def new
    @child = Child.new
  end

  def create
  end

  def update
  end

  def show

  end

  def destroy
  end

  private
 def child_params
  params.require(:child).permit(:name, :birthday)
  end

end
