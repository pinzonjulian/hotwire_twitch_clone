class LiveStreamsController < ApplicationController
  before_action :set_live_stream, only: %i[ show edit update destroy ]
  layout :define_layout

  # GET /live_streams or /live_streams.json
  def index
    @live_streams = LiveStream.all
  end

  # GET /live_streams/1 or /live_streams/1.json
  def show
    @recommended_live_streams = LiveStream.all
  end

  # GET /live_streams/new
  def new
    @live_stream = LiveStream.new
  end

  # GET /live_streams/1/edit
  def edit
  end

  # POST /live_streams or /live_streams.json
  def create
    @live_stream = LiveStream.new(live_stream_params)

    respond_to do |format|
      if @live_stream.save
        format.html { redirect_to live_stream_url(@live_stream), notice: "Live stream was successfully created." }
        format.json { render :show, status: :created, location: @live_stream }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @live_stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /live_streams/1 or /live_streams/1.json
  def update
    respond_to do |format|
      if @live_stream.update(live_stream_params)
        format.html { redirect_to live_stream_url(@live_stream), notice: "Live stream was successfully updated." }
        format.json { render :show, status: :ok, location: @live_stream }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @live_stream.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /live_streams/1 or /live_streams/1.json
  def destroy
    @live_stream.destroy

    respond_to do |format|
      format.html { redirect_to live_streams_url, notice: "Live stream was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_live_stream
      @live_stream = LiveStream.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def live_stream_params
      params.require(:live_stream).permit(:name, :url)
    end

    def define_layout
      case action_name
      when "show"
        "live_stream"
      else
        "application"
      end
    end
end
