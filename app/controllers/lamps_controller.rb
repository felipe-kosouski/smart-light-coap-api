class LampsController < ApplicationController
  before_action :set_lamp, only: [:show, :update, :destroy, :toggle, :on, :off]
  skip_before_action :verify_authenticity_token, only: [:toggle, :on, :off]

  def index
    CoAP::Client.new.get_by_uri('coap://192.168.0.23/light')
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
    if @lamp.status == false
      CoAP::Client.new.put_by_uri('coap://192.168.0.23/light', '1')
    else
      CoAP::Client.new.put_by_uri('coap://192.168.0.23/light', '0')
    end

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
