class ProductThumbnailsController < ApplicationController
  after_filter :reset_cache, :only => [ :create, :update, :destroy ]
  # GET /product_thumbnails
  # GET /product_thumbnails.xml
  def index
    @product_thumbnails = ProductThumbnail.all

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @product_thumbnails }
    end
  end

  # GET /product_thumbnails/1
  # GET /product_thumbnails/1.xml
  def show
    @product_thumbnail = ProductThumbnail.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product_thumbnail }
    end
  end

  # GET /product_thumbnails/new
  # GET /product_thumbnails/new.xml
  def new
    @product_thumbnail = ProductThumbnail.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product_thumbnail }
    end
  end

  # GET /product_thumbnails/1/edit
  def edit
    @product_thumbnail = ProductThumbnail.find(params[:id])
  end

  # POST /product_thumbnails
  # POST /product_thumbnails.xml
  def create
    @product_thumbnail = ProductThumbnail.new(params[:product_thumbnail])

    respond_to do |format|
      if @product_thumbnail.save
        format.html { redirect_to(@product_thumbnail, :notice => 'Product thumbnail was successfully created.') }
        format.xml  { render :xml => @product_thumbnail, :status => :created, :location => @product_thumbnail }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product_thumbnail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_thumbnails/1
  # PUT /product_thumbnails/1.xml
  def update
    @product_thumbnail = ProductThumbnail.find(params[:id])

    respond_to do |format|
      if @product_thumbnail.update_attributes(params[:product_thumbnail])
        format.html { redirect_to(@product_thumbnail, :notice => 'Product thumbnail was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product_thumbnail.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_thumbnails/1
  # DELETE /product_thumbnails/1.xml
  def destroy
    @product_thumbnail = ProductThumbnail.find(params[:id])
    @product_thumbnail.destroy

    respond_to do |format|
      format.html { redirect_to(product_thumbnails_url) }
      format.xml  { head :ok }
    end
  end
  private
  def reset_cache
    expire_fragment("product_thumbnail_slides")
  end
end
