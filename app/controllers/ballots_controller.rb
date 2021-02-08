class BallotsController < ApplicationController
  before_action :set_ballot, only: %i[ show edit update destroy ]

  # GET /ballots or /ballots.json
  def index
    @ballots = Ballot.all
  end

  # GET /ballots/1 or /ballots/1.json
  def show
  end

  # GET /ballots/new
  def new
    @ballot = Ballot.new
  end

  # GET /ballots/1/edit
  def edit
  end

  # POST /ballots or /ballots.json
  def create
    @ballots = ballot_params
    @ballots.each do |p|
    @ballot = Ballot.new(p)
    end
    respond_to do |format|
      puts "there should be something here #{@ballots.first[:option_id]}"
      @option = Option.where(id:(@ballots.first[:option_id])).first
      if @ballot.save
        format.html { redirect_to vote_path(@option.vote_id), notice: "Your vote was cast." }
        format.json { render :show, status: :created, location: @ballot }
      else
        format.html { render root_path, status: :unprocessable_entity }
        format.json { render json: @ballot.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /ballots/1 or /ballots/1.json
  def update
    respond_to do |format|
      if @ballot.update(ballot_params)
        format.html { redirect_to @ballot, notice: "ballot was successfully updated." }
        format.json { render :show, status: :ok, location: @ballot }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ballot.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ballots/1 or /ballots/1.json
  def destroy
    @ballot.destroy
    respond_to do |format|
      format.html { redirect_to ballots_url, notice: "ballot was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_ballot
      @ballot = Ballot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ballot_params
      params.require(:ballot).map do |p|
        p.permit(:position, :option_id, :participant_id)
      end
    end
end
