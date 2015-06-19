class CateringOrdersController < ApplicationController
  before_action :set_catering_order, only: [:show, :edit, :update, :destroy]

  # GET /catering_orders
  # GET /catering_orders.json
  def index
    @catering_orders = CateringOrder.all
  end

  # GET /catering_orders/1
  # GET /catering_orders/1.json
  def show
  end

  # GET /catering_orders/new
  def new
    @catering_order = CateringOrder.new
  end

  # GET /catering_orders/1/edit
  def edit
  end

  # POST /catering_orders
  # POST /catering_orders.json
  def create
    @catering_order = CateringOrder.new(catering_order_params)

    respond_to do |format|
      if @catering_order.save
        format.html { redirect_to @catering_order, notice: 'Catering order was successfully created.' }
        format.json { render :show, status: :created, location: @catering_order }
      else
        format.html { render :new }
        format.json { render json: @catering_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /catering_orders/1
  # PATCH/PUT /catering_orders/1.json
  def update
    respond_to do |format|
      if @catering_order.update(catering_order_params)
        format.html { redirect_to @catering_order, notice: 'Catering order was successfully updated.' }
        format.json { render :show, status: :ok, location: @catering_order }
      else
        format.html { render :edit }
        format.json { render json: @catering_order.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /catering_orders/1
  # DELETE /catering_orders/1.json
  def destroy
    @catering_order.destroy
    respond_to do |format|
      format.html { redirect_to catering_orders_url, notice: 'Catering order was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_catering_order
      @catering_order = CateringOrder.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def catering_order_params
      params[:catering_order]
    end
end
