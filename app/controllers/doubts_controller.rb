class DoubtsController < ApplicationController
  before_action :set_doubt, only: %i[ show edit update destroy escalate answer]

  # GET /doubts or /doubts.json
  def index

    if current_user.role == 2
    @doubts = Doubt.where('status > 1')
    else
      @doubts = Doubt.all
      end
  end

  # GET /doubts/1 or /doubts/1.json
  def show
    @comment = Comment.new
    @comments = @doubt.comments
  end

  # GET /doubts/new
  def new
    @doubt = Doubt.new

  end

  # GET /doubts/1/edit
  def edit
  end

  # POST /doubts or /doubts.json
  def create
    @doubt = Doubt.new(doubt_params)

    respond_to do |format|
      if @doubt.save
        format.html { redirect_to @doubt, notice: "Doubt was successfully created." }
        format.json { render :show, status: :created, location: @doubt }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @doubt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /doubts/1 or /doubts/1.json
  def update
    puts "PRASHANT"

    puts params[:commit]

    if params[:commit] == "Answer"
      if doubt_params[:answer].empty?
        return
      end
      @doubt.solver_id = current_user.id
      @doubt.status = 1
    end
    respond_to do |format|
      if @doubt.update(doubt_params)
        format.html { redirect_to @doubt, notice: "Doubt was successfully updated." }
        format.json { render :show, status: :ok, location: @doubt }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @doubt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /doubts/1 or /doubts/1.json
  def destroy
    @doubt.destroy
    respond_to do |format|
      format.html { redirect_to doubts_url, notice: "Doubt was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  def escalate
    if (current_user.role == 2)
    @doubt.status = 3
    @doubt.escalator_id = current_user.id
    @doubt.save

    else
      respond_to do |format|
        format.html { redirect_to doubts_url, notice: "You are not authorized." }
        format.json { head :no_content }
      end

      end
  end

  def answer

  end

    # Use callbacks to share common setup or constraints between actions.
    def set_doubt
      @doubt = Doubt.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def doubt_params
      params.require(:doubt).permit(:title, :description, :user_id, :answer, :solver_id)

    end
end
