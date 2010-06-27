class StudentRelationshipsController < ApplicationController
  # GET /student_relationships
  # GET /student_relationships.xml
  def index
    @student_relationships = StudentRelationship.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @student_relationships }
    end
  end

  # GET /student_relationships/1
  # GET /student_relationships/1.xml
  def show
    @student_relationship = StudentRelationship.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @student_relationship }
    end
  end

  # GET /student_relationships/new
  # GET /student_relationships/new.xml
  def new
    @student_relationship = StudentRelationship.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student_relationship }
    end
  end

  # GET /student_relationships/1/edit
  def edit
    @student_relationship = StudentRelationship.find(params[:id])
  end

  # POST /student_relationships
  # POST /student_relationships.xml
  def create
    @student_relationship = StudentRelationship.new(params[:student_relationship])

    respond_to do |format|
      if @student_relationship.save
        flash[:notice] = 'StudentRelationship was successfully created.'
        format.html { redirect_to(@student_relationship) }
        format.xml  { render :xml => @student_relationship, :status => :created, :location => @student_relationship }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @student_relationship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /student_relationships/1
  # PUT /student_relationships/1.xml
  def update
    @student_relationship = StudentRelationship.find(params[:id])

    respond_to do |format|
      if @student_relationship.update_attributes(params[:student_relationship])
        flash[:notice] = 'StudentRelationship was successfully updated.'
        format.html { redirect_to(@student_relationship) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student_relationship.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /student_relationships/1
  # DELETE /student_relationships/1.xml
  def destroy
    @student_relationship = StudentRelationship.find(params[:id])
    @student_relationship.destroy

    respond_to do |format|
      format.html { redirect_to(student_relationships_path) }
      format.xml  { head :ok }
    end
  end
end
