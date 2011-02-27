class ContactNumberTypesController < ApplicationController
  # GET /contact_number_types
  # GET /contact_number_types.xml
  def index
    @contact_number_types = ContactNumberType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contact_number_types }
    end
  end

  # GET /contact_number_types/new
  # GET /contact_number_types/new.xml
  def new
    @contact_number_type = ContactNumberType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contact_number_type }
    end
  end

  # GET /contact_number_types/1/edit
  def edit
    @contact_number_type = ContactNumberType.find(params[:id])
  end

  # POST /contact_number_types
  # POST /contact_number_types.xml
  def create
    @contact_number_type = ContactNumberType.new(params[:contact_number_type])

    respond_to do |format|
      if @contact_number_type.save
        flash[:notice] = 'Contact Number Type was successfully created.'
        format.html { redirect_to(contact_number_types_path) }
        format.xml  { render :xml => @contact_number_type, :status => :created, :location => @contact_number_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contact_number_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contact_number_types/1
  # PUT /contact_number_types/1.xml
  def update
    @contact_number_type = ContactNumberType.find(params[:id])

    respond_to do |format|
      if @contact_number_type.update_attributes(params[:contact_number_type])
        flash[:notice] = 'Contact Number Type was successfully updated.'
        format.html { redirect_to(contact_number_types_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contact_number_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_number_types/1
  # DELETE /contact_number_types/1.xml
  def destroy
    @contact_number_type = ContactNumberType.find(params[:id])
    @contact_number_type.destroy

    respond_to do |format|
      format.html { redirect_to(contact_number_types_path) }
      format.xml  { head :ok }
    end
  end
end
