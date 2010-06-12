class RelationsController < ApplicationController
  # GET /relations
  # GET /relations.xml
  def index
    @relations = Relation.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @relations }
    end
  end

  # GET /relations/1
  # GET /relations/1.xml
  def show
    @relation = Relation.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @relation }
    end
  end

  # GET /relations/new
  # GET /relations/new.xml
  def new
    @relation = Relation.new
    @relation.student_relations.build

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @relation }
    end
  end

  # GET /relations/1/edit
  def edit
    @relation = Relation.find(params[:id])
  end

  # POST /relations
  # POST /relations.xml
  def create
    @relation = Relation.new(params[:relation])

    respond_to do |format|
      if @relation.save
        flash[:notice] = 'Relation was successfully created.'
        format.html { redirect_to(@relation) }
        format.xml  { render :xml => @relation, :status => :created, :location => @relation }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @relation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /relations/1
  # PUT /relations/1.xml
  def update
    @relation = Relation.find(params[:id])

    respond_to do |format|
      if @relation.update_attributes(params[:relation])
        flash[:notice] = 'Relation was successfully updated.'
        format.html { redirect_to(@relation) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @relation.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /relations/1
  # DELETE /relations/1.xml
  def destroy
    @relation = Relation.find(params[:id])
    @relation.destroy

    respond_to do |format|
      format.html { redirect_to(relations_url) }
      format.xml  { head :ok }
    end
  end
end
