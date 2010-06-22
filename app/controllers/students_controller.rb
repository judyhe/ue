class StudentsController < ApplicationController
  # GET /students
  # GET /students.xml
  def index
    @students = Student.find_with_default_associations(:all)

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @students }
    end
  end

  # GET /students/1
  # GET /students/1.xml
  def show
    @student = Student.find_with_default_associations(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @student }
    end
  end

  # GET /students/new
  # GET /students/new.xml
  def new
    @student = Student.new
    @student.build_person
    @student.person.relationships.build
    @possible_family = Person.all_alphabetical

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @student }
    end
  end

  # GET /students/1/edit
  def edit
    @student = Student.find(params[:id])
    @student.person.relationships.build if @student.person.relationships.empty?
    @possible_family = Person.all_alphabetical
  end

  # POST /students
  # POST /students.xml
  def create
    @student = Student.new(params[:student])
    @student.person.relationships.build if @student.person.relationships.empty?
    @possible_family = Person.all_alphabetical
    
    respond_to do |format|
      if @student.save
        flash[:notice] = 'Student was successfully created.'
        format.html { redirect_to(@student) }
        format.xml  { render :xml => @student, :status => :created, :location => @student }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /students/1
  # PUT /students/1.xml
  def update    
    @student = Student.find(params[:id])
    @student.person.relationships.build if @student.person.relationships.empty?
    @possible_family = Person.all_alphabetical
    
    respond_to do |format|
      if @student.update_attributes(params[:student])
        flash[:notice] = 'Student was successfully updated.'
        format.html { redirect_to(@student) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @student.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /students/1
  # DELETE /students/1.xml
  def destroy
    @student = Student.find(params[:id])
    @student.destroy

    respond_to do |format|
      format.html { redirect_to(students_path) }
      format.xml  { head :ok }
    end
  end
end
