class OrganizationStaffTypesController < ApplicationController
  # GET /organization_staff_types
  # GET /organization_staff_types.xml
  def index
    @organization_staff_types = OrganizationStaffType.all
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @organization_staff_types }
    end
  end

  # GET /organization_staff_types/1
  # GET /organization_staff_types/1.xml
  def show
    @organization_staff_type = OrganizationStaffType.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @organization_staff_type }
    end
  end

  # GET /organization_staff_types/new
  # GET /organization_staff_types/new.xml
  def new
    @organization_staff_type = OrganizationStaffType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @organization_staff_type }
    end
  end

  # GET /organization_staff_types/1/edit
  def edit
    @organization_staff_type = OrganizationStaffType.find(params[:id])
  end

  # POST /organization_staff_types
  # POST /organization_staff_types.xml
  def create
    @organization_staff_type = OrganizationStaffType.new(params[:organization_staff_type])

    respond_to do |format|
      if @organization_staff_type.save
        flash[:notice] = 'OrganizationStaffType was successfully created.'
        format.html { redirect_to(organization_staff_types_url) }
        format.xml  { render :xml => @organization_staff_type, :status => :created, :location => @organization_staff_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @organization_staff_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /organization_staff_types/1
  # PUT /organization_staff_types/1.xml
  def update
    @organization_staff_type = OrganizationStaffType.find(params[:id])

    respond_to do |format|
      if @organization_staff_type.update_attributes(params[:organization_staff_type])
        flash[:notice] = 'OrganizationStaffType was successfully updated.'
        format.html { redirect_to(organization_staff_types_url) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @organization_staff_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /organization_staff_types/1
  # DELETE /organization_staff_types/1.xml
  def destroy
    @organization_staff_type = OrganizationStaffType.find(params[:id])
    @organization_staff_type.destroy

    respond_to do |format|
      format.html { redirect_to(organization_staff_types_url) }
      format.xml  { head :ok }
    end
  end
end
