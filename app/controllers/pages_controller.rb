class PagesController < ApplicationController
  def home
    @colors = Color.all
    @search = params[:search] || {}
    @cars = Car.filter(@search).page(params[:page])
  end
end
