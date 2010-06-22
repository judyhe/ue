class CommentsController < ApplicationController
  # GET /comments
  # GET /comments.xml
  def index
    @comments = Comment.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @comments }
    end
  end

  # GET /comments/1
  # GET /comments/1.xml
  def show
    @comment = Comment.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/new
  # GET /comments/new.xml
  def new
    @comment = Comment.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @comment }
    end
  end

  # GET /comments/1/edit
  def edit
    @comment = Comment.find(params[:id])
  end

  # POST /comments
  # POST /comments.xml
  def create
    @comment = Comment.new(params[:comment])

    respond_to do |format|
      if @comment.save
        flash[:notice] = 'Comment was successfully created.'
        format.html { redirect_to(@comment) }
        format.xml  { render :xml => @comment, :status => :created, :location => @comment }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /comments/1
  # PUT /comments/1.xml
  def update
    @comment = Comment.find(params[:id])
    @commentable = find_commentable
    
    respond_to do |format|
      if @comment.update_attributes(params[:comment])
        flash[:notice] = 'Comment was successfully updated.'
        format.html { redirect_to eval(commentable_url)}
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @comment.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /comments/1
  # DELETE /comments/1.xml
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    @commentable = find_commentable

    respond_to do |format|
      format.html { redirect_to eval(commentable_url) }
      format.xml  { head :ok }
    end
  end
  
  def find_commentable
    commentable_params[:name].classify.constantize.find(commentable_params[:val])
  end
  
  def commentable_url
    commentable_params[:name] + "_url(" + commentable_params[:val] +  ")"
  end
  
  def commentable_params
    params.each do |name, value|
      if name =~ /(.+)_id$/  
        return {:name => $1, :val => value} 
      end  
    end  
    nil      
  end
end