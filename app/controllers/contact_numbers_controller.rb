class ContactNumbersController < ApplicationController
  # GET /contact_numbers
  # GET /contact_numbers.xml
  def index
    @contact_numbers = ContactNumber.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @contact_numbers }
    end
  end

  # GET /contact_numbers/1
  # GET /contact_numbers/1.xml
  def show
    @contact_number = ContactNumber.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @contact_number }
    end
  end

  # GET /contact_numbers/new
  # GET /contact_numbers/new.xml
  def new
    @contact_number = ContactNumber.new
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @contact_number }
    end
  end

  # GET /contact_numbers/1/edit
  def edit
    @contact_number = ContactNumber.find(params[:id])
  end

  # POST /contact_numbers
  # POST /contact_numbers.xml
  def create
    @contact_number = ContactNumber.new(params[:contact_number])

    respond_to do |format|
      if @contact_number.save
        flash[:notice] = 'ContactNumber was successfully created.'
        format.html { redirect_to(@contact_number) }
        format.xml  { render :xml => @contact_number, :status => :created, :location => @contact_number }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @contact_number.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /contact_numbers/1
  # PUT /contact_numbers/1.xml
  def update
    @contact_number = ContactNumber.find(params[:id])

    respond_to do |format|
      if @contact_number.update_attributes(params[:contact_number])
        flash[:notice] = 'ContactNumber was successfully updated.'
        format.html { redirect_to(@contact_number) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @contact_number.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /contact_numbers/1
  # DELETE /contact_numbers/1.xml
  def destroy
    @contact_number = ContactNumber.find(params[:id])
    @contact_number.destroy

    respond_to do |format|
      format.html { redirect_to(contact_numbers_path) }
      format.xml  { head :ok }
    end
  end
end
