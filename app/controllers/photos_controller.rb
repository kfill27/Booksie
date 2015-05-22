class PhotosController < ApplicationController
  def index
    @photo = Photo.all
  end

  def show
    @photo = Photo.all
  end

  def new
    @photo = Photo.new
  end

  def edit
  end

  def create
    @photo = Photo.new
  end

end
