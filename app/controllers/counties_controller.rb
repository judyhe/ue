class CountiesController < ApplicationController
  # GET /counties
  # GET /counties.xml
  def index
    @counties = County.joins(:state).alphabetical

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @counties }
    end
  end


  # GET /counties/new
  # GET /counties/new.xml
  def new
    @county = County.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @county }
    end
  end

  # GET /counties/1/edit
  def edit
    @county = County.find(params[:id])
  end

  # POST /counties
  # POST /counties.xml
  def create
    @county = County.new(params[:county])

    respond_to do |format|
      if @county.save
        flash[:notice] = 'County was successfully created.'
        format.html { redirect_to(counties_path) }
        format.xml  { render :xml => @county, :status => :created, :location => @county }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @county.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /counties/1
  # PUT /counties/1.xml
  def update
    @county = County.find(params[:id])

    respond_to do |format|
      if @county.update_attributes(params[:county])
        flash[:notice] = 'County was successfully updated.'
        format.html { redirect_to(counties_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @county.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /counties/1
  # DELETE /counties/1.xml
  def destroy
    @county = County.find(params[:id])
    @county.destroy

    respond_to do |format|
      format.html { redirect_to(counties_path) }
      format.xml  { head :ok }
    end
  end
end
