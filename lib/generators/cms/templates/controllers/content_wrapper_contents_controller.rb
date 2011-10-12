class ContentWrapperContentsController < ApplicationController
  before_filter :load_content_wrapper, :only => [ :index, :new, :create ]
  before_filter :load_contents, :only => [ :edit, :new ]
  # GET /content_wrapper_contents
  # GET /content_wrapper_contents.xml
  def index
    if @content_wrapper
      @content_wrapper_contents = ContentWrapperContent.all
    else
      @content_wrapper_contents = @content_wrapper.content_wrapper_contents.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @content_wrapper_contents }
    end
  end

  # GET /content_wrapper_contents/1
  # GET /content_wrapper_contents/1.xml
  def show
    @content_wrapper_content = ContentWrapperContent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @content_wrapper_content }
    end
  end

  # GET /content_wrapper_contents/new
  # GET /content_wrapper_contents/new.xml
  def new
    @content_wrapper_content = @content_wrapper.content_wrapper_contents.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @content_wrapper_content }
    end
  end

  # GET /content_wrapper_contents/1/edit
  def edit
    @content_wrapper_content = ContentWrapperContent.find(params[:id])
  end

  # POST /content_wrapper_contents
  # POST /content_wrapper_contents.xml
  def create
    @content_wrapper_content = @content_wrapper.content_wrapper_contents.new(params[:content_wrapper_content])

    respond_to do |format|
      if @content_wrapper_content.save
        format.html { redirect_to(@content_wrapper_content.content_wrapper, :notice => 'Content wrapper content was successfully created.') }
        format.xml  { render :xml => @content_wrapper_content, :status => :created, :location => @content_wrapper_content }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @content_wrapper_content.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /content_wrapper_contents/1
  # PUT /content_wrapper_contents/1.xml
  def update
    @content_wrapper_content = ContentWrapperContent.find(params[:id])

    respond_to do |format|
      if @content_wrapper_content.update_attributes(params[:content_wrapper_content])
        format.html { redirect_to(@content_wrapper_content.content_wrapper, :notice => 'Content wrapper content was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @content_wrapper_content.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /content_wrapper_contents/1
  # DELETE /content_wrapper_contents/1.xml
  def destroy
    @content_wrapper_content = ContentWrapperContent.find(params[:id])
    content_wrapper = @content_wrapper_content.content_wrapper
    @content_wrapper_content.destroy

    respond_to do |format|
      format.html { redirect_to(content_wrapper) }
      format.xml  { head :ok }
    end
  end

  private
  def load_content_wrapper
    @content_wrapper = ContentWrapper.find(params[:content_wrapper_id]) if params[:content_wrapper_id]
  end
end
