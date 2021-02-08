class BallotController < ApplicationController
  before_action :set_ballot, only: %i[ show edit update destroy ]

  # GET /ballots or /ballots.json
  def index
    @ballots = ballot.all
  end

  # GET /ballots/1 or /ballots/1.json
  def show
  end

  # GET /ballots/new
  def new
    @ballot = ballot.new
    @ballot.options.build 
    @ballot.participants.build 
  end

  # GET /ballots/1/edit
  def edit
  end

  # POST /ballots or /ballots.json
  def create
    @ballot = ballot.new(ballot_params)

    respond_to do |format|
      if @ballot.save
        format.html { redirect_to @ballot, notice: "ballot was successfully created." }
        format.json { render :show, status: :created, location: @ballot }
      else
        format.html { render :new, status: :unprocessable_entity }
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
      @ballot = ballot.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def ballot_params
      params.require(:ballot).permit(:finished, :user_id, options_attributes: ([:_destroy] + Option.column_names.map(&:to_sym)),
                                   participants_attributes: ([:_destroy] + Participant.column_names.map(&:to_sym)))
    end
end
