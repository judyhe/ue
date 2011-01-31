class SchoolStaffsController < ApplicationController
  # GET /school_staffs
  # GET /school_staffs.xml
  def index
    @school_staffs = SchoolStaff.alphabetical.default_associations

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @school_staffs }
    end
  end

  # GET /school_staffs/1
  # GET /school_staffs/1.xml
  def show
    @school_staff = SchoolStaff.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @school_staff }
    end
  end

  # GET /school_staffs/new
  # GET /school_staffs/new.xml
  def new
    @school_staff = SchoolStaff.new
    @school_staff.build_person
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @school_staff }
    end
  end

  # GET /school_staffs/1/edit
  def edit
    @school_staff = SchoolStaff.find(params[:id])
  end

  # POST /school_staffs
  # POST /school_staffs.xml
  def create
    @school_staff = SchoolStaff.new(params[:school_staff])

    respond_to do |format|
      if @school_staff.save
        flash[:notice] = 'SchoolStaff was successfully created.'
        format.html { redirect_to(@school_staff) }
        format.xml  { render :xml => @school_staff, :status => :created, :location => @school_staff }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @school_staff.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /school_staffs/1
  # PUT /school_staffs/1.xml
  def update
    @school_staff = SchoolStaff.find(params[:id])

    respond_to do |format|
      if @school_staff.update_attributes(params[:school_staff])
        flash[:notice] = 'SchoolStaff was successfully updated.'
        format.html { redirect_to(@school_staff) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @school_staff.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /school_staffs/1
  # DELETE /school_staffs/1.xml
  def destroy
    @school_staff = SchoolStaff.find(params[:id])
    @school_staff.destroy

    respond_to do |format|
      format.html { redirect_to(school_staffs_url) }
      format.xml  { head :ok }
    end
  end
end
