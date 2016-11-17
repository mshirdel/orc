class HeadwordsController < ApplicationController
  before_action :set_headword, only: [:show, :edit, :update, :destroy]

  # GET /headwords
  # GET /headwords.json
  def index
    @headwords = Headword.all
  end

  # GET /headwords/1
  # GET /headwords/1.json
  def show
  end

  # GET /headwords/new
  def new
    @headword = Headword.new
  end

  # GET /headwords/1/edit
  def edit
  end

  # POST /headwords
  # POST /headwords.json
  def create
    @headword = Headword.new(headword_params)

    respond_to do |format|
      if @headword.save
        format.html { redirect_to @headword, notice: 'Headword was successfully created.' }
        format.json { render :show, status: :created, location: @headword }
      else
        format.html { render :new }
        format.json { render json: @headword.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /headwords/1
  # PATCH/PUT /headwords/1.json
  def update
    respond_to do |format|
      if @headword.update(headword_params)
        format.html { redirect_to @headword, notice: 'Headword was successfully updated.' }
        format.json { render :show, status: :ok, location: @headword }
      else
        format.html { render :edit }
        format.json { render json: @headword.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /headwords/1
  # DELETE /headwords/1.json
  def destroy
    @headword.destroy
    respond_to do |format|
      format.html { redirect_to headwords_url, notice: 'Headword was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_headword
      @headword = Headword.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def headword_params
      params.fetch(:headword, {})
    end
end
