class LampsController < ApplicationController
  before_action :set_lamp, only: [:show, :update, :destroy, :toggle]
  skip_before_action :verify_authenticity_token, only: [:toggle]

  def index
    @lamps = Lamp.all
    render json: @lamps
  end

  def show
    render json: @lamp
  end

  def create
    @lamp = Lamp.new(lamp_params)

    if @lamp.save
      render json: @lamp, status: 200
    else
      render json: @lamp.errors, status: :unprocessable_entity
    end
  end

  def update
    if @lamp.update(lamp_params)
      render json: @lamp, status: 200
    else
      render json: @lamp.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @lamp.destroy
  end

  def toggle
    @lamp.toggle
    render json: @lamp, status: 200
  end

  private
    def set_lamp
      @lamp = Lamp.find(params[:id])
    end

    def lamp_params
      params.require(:lamp).permit(:name, :status)
    end
end
