class VotesController < ApplicationController
  before_action :set_vote, only: %i[ show edit update destroy ]

  # GET /votes or /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1 or /votes/1.json
  def show
  end

  # GET /votes/1/ballot/participant or /votes/1/ballot/participant.json
  def ballot
    @ballot = Array.new { Ballot.new }
    @options = Option.where(vote_id: params[:id]).order(created_at: :desc)
    @participant = Participant.find_by(id: params[:participant])
  end

  # GET /votes/new
  def new
    @vote = Vote.new
    @vote.options.build 
    @vote.participants.build 
  end

  # GET /votes/1/edit
  def edit
  end

  # POST /votes or /votes.json
  def create

    @modified_params = vote_params
    @user = User.all
    @participants = @modified_params[:participants_attributes]

    @participants.each do |p|
      participant = p[1]
      u = User.where(username: (participant[:username])).first
      e = User.where(email: (participant[:email])).first
        if u != nil
            participant[:user_id] = u.id
        elsif e != nil
          participant[:user_id] == e.id
        else
        end
    end

    @vote = Vote.new(@modified_params)
    respond_to do |format|
      if @vote.save
        format.html { redirect_to @vote, notice: "Vote was successfully created." }
        format.json { render :show, status: :created, location: @vote }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /votes/1 or /votes/1.json
  def update
    respond_to do |format|
      if @vote.update(vote_params)
        format.html { redirect_to @vote, notice: "Vote was successfully updated." }
        format.json { render :show, status: :ok, location: @vote }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @vote.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /votes/1 or /votes/1.json
  def destroy
    @vote.destroy
    respond_to do |format|
      format.html { redirect_to votes_url, notice: "Vote was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def vote_params
      params.require(:vote).permit(:finished, :user_id, options_attributes: ([:_destroy] + Option.column_names.map(&:to_sym)),
                                   participants_attributes: ([:_destroy] + Participant.column_names.map(&:to_sym)))
    end
end
