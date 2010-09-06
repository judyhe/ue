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

    respond_to do |format|
      if @term_session.save
        flash[:notice] = 'TermSession was successfully created.'
        format.html { redirect_to(@term_session) }
        format.xml  { render :xml => @term_session, :status => :created, :location => @term_session }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @term_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /term_sessions/1
  # PUT /term_sessions/1.xml
  def update
    @term_session = TermSession.find(params[:id])

    respond_to do |format|
      if @term_session.update_attributes(params[:term_session])
        flash[:notice] = 'TermSession was successfully updated.'
        format.html { redirect_to(@term_session.term) }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @term_session.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /term_sessions/1
  # DELETE /term_sessions/1.xml
  def destroy
    @term_session = TermSession.find(params[:id])
    @term_session.destroy

    respond_to do |format|
      format.html { redirect_to(term_sessions_url) }
      format.xml  { head :ok }
    end
  end
end
