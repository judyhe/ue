class OrganizationStaffsController < ApplicationController
  # GET /organization_staffs
  # GET /organization_staffs.xml
  def index
    @organization_staffs = OrganizationStaff.alphabetical.default_associations
    
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @organization_staffs }
    end
  end

  # GET /organization_staffs/1
  # GET /organization_staffs/1.xml
  def show
    @organization_staff = OrganizationStaff.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @organization_staff }
    end
  end

  # GET /organization_staffs/new
  # GET /organization_staffs/new.xml
  def new
    @organization_staff = OrganizationStaff.new
    @organization_staff.build_person
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @organization_staff }
    end
  end

  # GET /organization_staffs/1/edit
  def edit
    @organization_staff = OrganizationStaff.find(params[:id])
  end

  # POST /organization_staffs
  # POST /organization_staffs.xml
  def create
    @organization_staff = OrganizationStaff.new(params[:organization_staff])

    respond_to do |format|
      if @organization_staff.save
        flash[:notice] = 'OrganizationStaff was successfully created.'
        format.html { redirect_to(@organization_staff) }
        format.xml  { render :xml => @organization_staff, :status => :created, :location => @organization_staff }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @organization_staff.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /organization_staffs/1
  # PUT /organization_staffs/1.xml
  def update
    @organization_staff = OrganizationStaff.find(params[:id])

    respond_to do |format|
      if @organization_staff.update_attributes(params[:organization_staff])
        flash[:notice] = 'OrganizationStaff was successfully updated.'
        format.html { redirect_to(@organization_staff) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @organization_staff.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /organization_staffs/1
  # DELETE /organization_staffs/1.xml
  def destroy
    @organization_staff = OrganizationStaff.find(params[:id])
    @organization_staff.destroy

    respond_to do |format|
      format.html { redirect_to(organization_staffs_url) }
      format.xml  { head :ok }
    end
  end
end
