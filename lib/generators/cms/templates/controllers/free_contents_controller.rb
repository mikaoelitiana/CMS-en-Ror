class FreeContentsController < ApplicationController
  # GET /free_contents
  # GET /free_contents.xml
  def index
    @free_contents = FreeContent.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @free_contents }
    end
  end

  # GET /free_contents/1
  # GET /free_contents/1.xml
  def show
    @free_content = FreeContent.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @free_content }
    end
  end

  # GET /free_contents/new
  # GET /free_contents/new.xml
  def new
    @free_content = FreeContent.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @free_content }
    end
  end

  # GET /free_contents/1/edit
  def edit
    @free_content = FreeContent.find(params[:id])
  end

  # POST /free_contents
  # POST /free_contents.xml
  def create
    @free_content = FreeContent.new(params[:free_content])

    respond_to do |format|
      if @free_content.save
        format.html { redirect_to(@free_content, :notice => 'Free content was successfully created.') }
        format.xml  { render :xml => @free_content, :status => :created, :location => @free_content }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @free_content.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /free_contents/1
  # PUT /free_contents/1.xml
  def update
    @free_content = FreeContent.find(params[:id])

    respond_to do |format|
      if @free_content.update_attributes(params[:free_content])
        format.html { redirect_to(@free_content, :notice => 'Free content was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @free_content.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /free_contents/1
  # DELETE /free_contents/1.xml
  def destroy
    @free_content = FreeContent.find(params[:id])
    @free_content.destroy

    respond_to do |format|
      format.html { redirect_to(free_contents_url) }
      format.xml  { head :ok }
    end
  end
end
