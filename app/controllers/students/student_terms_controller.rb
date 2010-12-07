class Students::StudentTermsController < ApplicationController
  
  # GET /students/:student_id/student_terms/new
  def new
    @student_term = StudentTerm.new
    @student = Student.find(params[:student_id])
  end

  # GET /students/:student_id/student_terms/1/edit
  def edit
    @student_term = StudentTerm.find(params[:id])
  end

  # POST /student_terms
  def create
    @student_term = StudentTerm.new(params[:student_term])
    if @student_term.save
      flash[:notice] = 'StudentTerm was successfully created.'
      redirect_to(@student_term.student)
    else
      render :action => "new"
    end
  end

  # PUT /students/:student_id/student_terms/1
  def update
    @student_term = StudentTerm.find(params[:id])
    if @student_term.update_attributes(params[:student_term])
      flash[:notice] = 'StudentTerm was successfully updated.'
      redirect_to(@student_term.student)
    else
      render :action => "edit"
    end
  end

end
