class ContainerContentsController < ApplicationController
  before_filter :load_container, :only => [ :index, :new, :create ]
  before_filter :load_contents, :only => [ :edit, :new ]
  # GET /container_contents
  # GET /container_contents.xml
  def index
    if @container
      @container_contents = @container.container_contents
    else
      @container_contents = ContainerContent.all
    end

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @container_contents }
    end
  end

  # GET /container_contents/1
  # GET /container_contents/1.xml
  def show
    @container_content = ContainerContent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @container_content }
    end
  end

  # GET /container_contents/new
  # GET /container_contents/new.xml
  def new
    @container_content = @container.container_contents.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @container_content }
    end
  end

  # GET /container_contents/1/edit
  def edit
    @container_content = ContainerContent.find(params[:id])
  end

  # POST /container_contents
  # POST /container_contents.xml
  def create
    @container_content = @container.container_contents.new(params[:container_content])

    respond_to do |format|
      if @container_content.save
        format.html { redirect_to(@container_content.container, :notice => 'Container content was successfully created.') }
        format.xml  { render :xml => @container_content, :status => :created, :location => @container_content }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @container_content.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /container_contents/1
  # PUT /container_contents/1.xml
  def update
    @container_content = ContainerContent.find(params[:id])

    respond_to do |format|
      if @container_content.update_attributes(params[:container_content])
        format.html { redirect_to(@container_content.container, :notice => 'Container content was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @container_content.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /container_contents/1
  # DELETE /container_contents/1.xml
  def destroy
    @container_content = ContainerContent.find(params[:id])
    container = @container_content.container
    @container_content.destroy

    respond_to do |format|
      format.html { redirect_to(container) }
      format.xml  { head :ok }
    end
  end

  private
  def load_container
    @container = Container.find(params[:container_id]) if params[:container_id]
  end
end
