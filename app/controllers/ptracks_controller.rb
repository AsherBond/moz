class PtracksController < ApplicationController
  # GET /ptracks
  # GET /ptracks.json
  def index
    @ptracks = Ptrack.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ptracks }
    end
  end

  # GET /ptracks/1
  # GET /ptracks/1.json
  def show
    @ptrack = Ptrack.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @ptrack }
    end
  end

  # GET /ptracks/new
  # GET /ptracks/new.json
  def new
    @ptrack = Ptrack.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @ptrack }
    end
  end

  # GET /ptracks/1/edit
  def edit
    @ptrack = Ptrack.find(params[:id])
  end

  # POST /ptracks
  # POST /ptracks.json
  def create
    @ptrack = Ptrack.new(params[:ptrack])

    respond_to do |format|
      if @ptrack.save
        format.html { redirect_to @ptrack, notice: 'Ptrack was successfully created.' }
        format.json { render json: @ptrack, status: :created, location: @ptrack }
      else
        format.html { render action: "new" }
        format.json { render json: @ptrack.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ptracks/1
  # PUT /ptracks/1.json
  def update
    @ptrack = Ptrack.find(params[:id])

    respond_to do |format|
      if @ptrack.update_attributes(params[:ptrack])
        format.html { redirect_to @ptrack, notice: 'Ptrack was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @ptrack.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ptracks/1
  # DELETE /ptracks/1.json
  def destroy
    @ptrack = Ptrack.find(params[:id])
    @ptrack.destroy

    respond_to do |format|
      format.html { redirect_to ptracks_url }
      format.json { head :no_content }
    end
  end
end
