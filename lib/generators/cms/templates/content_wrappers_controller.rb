class ContentWrappersController < ApplicationController
  before_filter :load_contents, :only => [ :new, :edit ]
  # GET /content_wrappers
  # GET /content_wrappers.xml
  def index
    @content_wrappers = ContentWrapper.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @content_wrappers }
    end
  end

  # GET /content_wrappers/1
  # GET /content_wrappers/1.xml
  def show
    @content_wrapper = ContentWrapper.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @content_wrapper }
    end
  end

  # GET /content_wrappers/new
  # GET /content_wrappers/new.xml
  def new
    @content_wrapper = ContentWrapper.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @content_wrapper }
    end
  end

  # GET /content_wrappers/1/edit
  def edit
    @content_wrapper = ContentWrapper.find(params[:id])
  end

  # POST /content_wrappers
  # POST /content_wrappers.xml
  def create
    @content_wrapper = ContentWrapper.new(params[:content_wrapper])

    respond_to do |format|
      if @content_wrapper.save
        format.html { redirect_to(@content_wrapper, :notice => 'Content wrapper was successfully created.') }
        format.xml  { render :xml => @content_wrapper, :status => :created, :location => @content_wrapper }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @content_wrapper.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /content_wrappers/1
  # PUT /content_wrappers/1.xml
  def update
    @content_wrapper = ContentWrapper.find(params[:id])

    respond_to do |format|
      if @content_wrapper.update_attributes(params[:content_wrapper])
        format.html { redirect_to(@content_wrapper, :notice => 'Content wrapper was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @content_wrapper.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /content_wrappers/1
  # DELETE /content_wrappers/1.xml
  def destroy
    @content_wrapper = ContentWrapper.find(params[:id])
    @content_wrapper.destroy

    respond_to do |format|
      format.html { redirect_to(content_wrappers_url) }
      format.xml  { head :ok }
    end
  end
end
