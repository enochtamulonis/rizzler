class PickupLinesController < ApplicationController
  before_action :set_pickup_line, only: %i[ show edit update destroy ]

  # GET /pickup_lines or /pickup_lines.json
  def index
    @pickup_lines = PickupLine.all
  end

  # GET /pickup_lines/1 or /pickup_lines/1.json
  def show
  end

  # GET /pickup_lines/new
  def new
    @pickup_line = PickupLine.new
  end

  # GET /pickup_lines/1/edit
  def edit
  end

  # POST /pickup_lines or /pickup_lines.json
  def create
    @pickup_line = PickupLine.new(pickup_line_params)
    @pickup_line.user = current_user
    respond_to do |format|
      if @pickup_line.save
        format.html { redirect_to pickup_line_url(@pickup_line), notice: "Pickup line was successfully created." }
        format.json { render :show, status: :created, location: @pickup_line }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @pickup_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /pickup_lines/1 or /pickup_lines/1.json
  def update
    respond_to do |format|
      if @pickup_line.update(pickup_line_params)
        format.html { redirect_to pickup_line_url(@pickup_line), notice: "Pickup line was successfully updated." }
        format.json { render :show, status: :ok, location: @pickup_line }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @pickup_line.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pickup_lines/1 or /pickup_lines/1.json
  def destroy
    @pickup_line.destroy!

    respond_to do |format|
      format.html { redirect_to pickup_lines_url, notice: "Pickup line was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_pickup_line
      @pickup_line = PickupLine.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def pickup_line_params
      params.require(:pickup_line).permit(:text)
    end
end
