class TermSessionsController < ApplicationController
  # GET /term_sessions
  # GET /term_sessions.xml
  def index
    @term_sessions = TermSession.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @term_sessions }
    end
  end

  # GET /term_sessions/1
  # GET /term_sessions/1.xml
  def show
    @term_session = TermSession.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @term_session }
    end
  end

  # GET /term_sessions/new
  # GET /term_sessions/new.xml
  def new
    @term_session = TermSession.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @term_session }
    end
  end

  # GET /term_sessions/1/edit
  def edit
    @term_session = TermSession.find(params[:id])
  end

  # POST /term_sessions
  # POST /term_sessions.xml
  def create
    @term_session = TermSession.new(params[:term_session])
    @term_session.save 
    render :partial => "term_session", :locals => {:term_session => @term_session}
  end

  # PUT /term_sessions/1
  # PUT /term_sessions/1.xml
  def update
    @term_session = TermSession.find(params[:id])
    @term_session.update_attributes(params[:term_session])
    render :inline => params[:term_session].values
  end

  # DELETE /term_sessions/1
  # DELETE /term_sessions/1.xml
  def destroy
    @term_session = TermSession.find(params[:id])
    @term_session.destroy

    respond_to do |format|
      format.html { redirect_to(@term_session.term) }
      format.xml  { head :ok }
    end
  end
  
end
