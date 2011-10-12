class ProductFamiliesController < ApplicationController
  # GET /product_families
  # GET /product_families.xml
  def index
    @product_families = ProductFamily.find(:all, :include => :products, :order => :name)
    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @product_families }
    end
  end
  alias :all :index

  # GET /product_families/1
  # GET /product_families/1.xml
  def show
    @product_family = ProductFamily.find(params[:id], :include => [ :products, :navigation_entry ])
    unless dark_side?
      @current_navigation_entry = @product_family.navigation_entry
      load_misc_stuffs
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @product_family }
    end
  end

  # GET /product_families/new
  # GET /product_families/new.xml
  def new
    @product_family = ProductFamily.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @product_family }
    end
  end

  # GET /product_families/1/edit
  def edit
    @product_family = ProductFamily.find(params[:id])
  end

  # POST /product_families
  # POST /product_families.xml
  def create
    @product_family = ProductFamily.new(params[:product_family])

    respond_to do |format|
      if @product_family.save
        @navigation = NavigationEntry.new
        @navigation.parent_id = NavigationEntry.where(:text => 'Produits')
        @navigation.name = @product_family.description
        @navigation.text = @product_family.name
        @navigation.url = product_family_path(@product_family)
        @navigation.save
        format.html { redirect_to(@product_family, :notice => 'Product family was successfully created.') }
        format.xml  { render :xml => @product_family, :status => :created, :location => @product_family }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @product_family.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /product_families/1
  # PUT /product_families/1.xml
  def update
    @product_family = ProductFamily.find(params[:id])

    respond_to do |format|
      if @product_family.update_attributes(params[:product_family])
        format.html { redirect_to(@product_family, :notice => 'Product family was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @product_family.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /product_families/1
  # DELETE /product_families/1.xml
  def destroy
    @product_family = ProductFamily.find(params[:id])
    @product_family.destroy

    respond_to do |format|
      format.html { redirect_to(product_families_url) }
      format.xml  { head :ok }
    end
  end
end
