class StudentRelationsController < ApplicationController
  # GET /student_relations
  # GET /student_relations.xml
  def index
    @student_relations = StudentRelation.ordered

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @student_relations }
    end
  end

  # GET /student_relations/1
  # GET /student_relations/1.xml
  def show
    @student_relation = StudentRelation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @student_relation }
    end
  end

  # GET /student_relations/new
  # GET /student_relations/new.xml
  def new
    @student_relation = StudentRelation.new
    @student_relation.build_person
    
    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student_relation }
    end
  end

  # GET /student_relations/1/edit
  def edit
    @student_relation = StudentRelation.find(params[:id])
  end

  # POST /student_relations
  # POST /student_relations.xml
  def create
    @student_relation = StudentRelation.new(params[:student_relation])

    respond_to do |format|
      if @student_relation.save
        flash[:notice] = 'StudentRelation was successfully created.'
        format.html { redirect_to(@student_relation) }
        format.xml  { render :xml => @student_relation, :status => :created, :location => @student_relation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @student_relation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /student_relations/1
  # PUT /student_relations/1.xml
  def update
    @student_relation = StudentRelation.find(params[:id])

    respond_to do |format|
      if @student_relation.update_attributes(params[:student_relation])
        flash[:notice] = 'StudentRelation was successfully updated.'
        format.html { redirect_to(@student_relation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student_relation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /student_relations/1
  # DELETE /student_relations/1.xml
  def destroy
    @student_relation = StudentRelation.find(params[:id])
    @student_relation.destroy

    respond_to do |format|
      format.html { redirect_to(student_relations_url) }
      format.xml  { head :ok }
    end
  end
end
