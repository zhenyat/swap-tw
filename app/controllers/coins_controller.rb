class CoinsController < ApplicationController
  before_action :set_coin, only: %i[ show edit update destroy ]
  
  def index
    @coins = Coin.all.order(:id)
  end

  def show
  end

  def new
    @coin = Coin.new
  end

  def edit
  end

  def create
    @coin = Coin.new(coin_params)

    if @coin.save
      redirect_to @coin, notice: "Coin was successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def update
    if @coin.update(coin_params)
      redirect_to @coin, notice: "Coin was successfully updated."
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @coin.destroy
    redirect_to coins_url, notice: "Coin was successfully destroyed."
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_coin
      @coin = Coin.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def coin_params
      params.require(:coin).permit(:name, :code, :kind, :unicode, :status, :cover_image, :remove_cover_image, images: [])
    end
end
