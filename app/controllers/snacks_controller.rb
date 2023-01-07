class SnacksController < ApplicationController
  def index
    @snacks = Snack.all
  end

  def show
    @snack = Snack.find(params[:id])
  end

  def new
  end

  def create
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def snack_params
    params
  end
end