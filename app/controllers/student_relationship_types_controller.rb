class StudentRelationshipTypesController < ApplicationController
  # GET /student_relationship_types
  # GET /student_relationship_types.xml
  def index
    @student_relationship_types = StudentRelationshipType.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @student_relationship_types }
    end
  end

  # GET /student_relationship_types/new
  # GET /student_relationship_types/new.xml
  def new
    @student_relationship_type = StudentRelationshipType.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student_relationship_type }
    end
  end

  # GET /student_relationship_types/1/edit
  def edit
    @student_relationship_type = StudentRelationshipType.find(params[:id])
  end

  # POST /student_relationship_types
  # POST /student_relationship_types.xml
  def create
    @student_relationship_type = StudentRelationshipType.new(params[:student_relationship_type])

    respond_to do |format|
      if @student_relationship_type.save
        flash[:notice] = 'StudentRelationshipType was successfully created.'
        format.html { redirect_to(student_relationship_types_path) }
        format.xml  { render :xml => @student_relationship_type, :status => :created, :location => @student_relationship_type }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @student_relationship_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /student_relationship_types/1
  # PUT /student_relationship_types/1.xml
  def update
    @student_relationship_type = StudentRelationshipType.find(params[:id])

    respond_to do |format|
      if @student_relationship_type.update_attributes(params[:student_relationship_type])
        flash[:notice] = 'StudentRelationshipType was successfully updated.'
        format.html { redirect_to(student_relationship_types_path) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student_relationship_type.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /student_relationship_types/1
  # DELETE /student_relationship_types/1.xml
  def destroy
    @student_relationship_type = StudentRelationshipType.find(params[:id])
    @student_relationship_type.destroy

    respond_to do |format|
      format.html { redirect_to(student_relationship_types_path) }
      format.xml  { head :ok }
    end
  end
end
