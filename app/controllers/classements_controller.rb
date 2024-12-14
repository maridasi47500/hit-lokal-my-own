class ClassementsController < ApplicationController
  before_action :set_classement, only: %i[ show edit update destroy ]

  # GET /classements or /classements.json
  def index
    #@classements = Classement.all
    @weeks = (1..52).to_a
    @years = (2020..Date.today.year).to_a
    @classement = Classement.where(semaine_no: params[:week], annee: params[:year])
  end

  def show
    @classement = Classement.where(week: params[:week], year: params[:year])
  end


  # GET /classements/new
  def new
    @classement = Classement.new
  end

  # GET /classements/1/edit
  def edit
  end

  # POST /classements or /classements.json
  def create
    @classement = Classement.new(classement_params)

    respond_to do |format|
      if @classement.save
        format.html { redirect_to classement_url(@classement), notice: "Classement was successfully created." }
        format.json { render :show, status: :created, location: @classement }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @classement.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /classements/1 or /classements/1.json
  def update
    respond_to do |format|
      if @classement.update(classement_params)
        format.html { redirect_to classement_url(@classement), notice: "Classement was successfully updated." }
        format.json { render :show, status: :ok, location: @classement }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @classement.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /classements/1 or /classements/1.json
  def destroy
    @classement.destroy

    respond_to do |format|
      format.html { redirect_to classements_url, notice: "Classement was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_classement
      #@classement = Classement.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def classement_params
      params.fetch(:classement, {})
    end
end
