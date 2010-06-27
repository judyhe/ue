class SchoolStaffTypesController < ApplicationController
  # GET /school_staff_types
  # GET /school_staff_types.xml
  def index
    @school_staff_types = SchoolStaffType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @school_staff_types }
    end
  end

  # GET /school_staff_types/1
  # GET /school_staff_types/1.xml
  def show
    @school_staff_type = SchoolStaffType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @school_staff_type }
    end
  end

  # GET /school_staff_types/new
  # GET /school_staff_types/new.xml
  def new
    @school_staff_type = SchoolStaffType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @school_staff_type }
    end
  end

  # GET /school_staff_types/1/edit
  def edit
    @school_staff_type = SchoolStaffType.find(params[:id])
  end

  # POST /school_staff_types
  # POST /school_staff_types.xml
  def create
    @school_staff_type = SchoolStaffType.new(params[:school_staff_type])

    respond_to do |format|
      if @school_staff_type.save
        flash[:notice] = 'SchoolStaffType was successfully created.'
        format.html { redirect_to(school_staff_types_url) }
        format.xml  { render :xml => @school_staff_type, :status => :created, :location => @school_staff_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @school_staff_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /school_staff_types/1
  # PUT /school_staff_types/1.xml
  def update
    @school_staff_type = SchoolStaffType.find(params[:id])

    respond_to do |format|
      if @school_staff_type.update_attributes(params[:school_staff_type])
        flash[:notice] = 'SchoolStaffType was successfully updated.'
        format.html { redirect_to(school_staff_types_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @school_staff_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /school_staff_types/1
  # DELETE /school_staff_types/1.xml
  def destroy
    @school_staff_type = SchoolStaffType.find(params[:id])
    @school_staff_type.destroy

    respond_to do |format|
      format.html { redirect_to(school_staff_types_url) }
      format.xml  { head :ok }
    end
  end
end
