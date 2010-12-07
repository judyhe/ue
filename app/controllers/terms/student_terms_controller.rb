class Terms::StudentTermsController < ApplicationController
  
  # GET /terms/:term_id/student_terms/new
  def new
    @student_term = StudentTerm.new
    @term = Term.find(params[:term_id])
  end

  # GET /terms/:term_id/student_terms/1/edit
  def edit
    @student_term = StudentTerm.find(params[:id])
  end

  # POST /term/:term_id/student_terms
  def create
    @student_term = StudentTerm.new(params[:student_term])
    @student_term.term_id = params[:term_id]
    
    if @student_term.save
      flash[:notice] = 'StudentTerm was successfully created.'
      redirect_to(@student_term.term)
    else
      render :action => "new"
    end
  end

  # PUT /term/:term_id/student_terms/1
  def update
    @student_term = StudentTerm.find(params[:id])
    if @student_term.update_attributes(params[:student_term])
      flash[:notice] = 'StudentTerm was successfully updated.'
      redirect_to(@student_term.term)
    else
      render :action => "edit"
    end
  end

end
