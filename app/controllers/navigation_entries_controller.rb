class NavigationEntriesController < ApplicationController
  # GET /navigation_entries
  # GET /navigation_entries.xml
  def index
    @navigation_entries = NavigationEntry.scoped
    @ordered_navigation_entries = @navigation_entries.arrange( :order => :full_name )

    respond_to do |format|
      format.html # index.html.erb
      format.xml  { render :xml => @navigation_entries }
    end
  end

  # GET /navigation_entries/1
  # GET /navigation_entries/1.xml
  def show
    if dark_side?
      @navigation_entry = NavigationEntry.find(params[:id])
    else
      @navigation_entry = NavigationEntry.find(params[:id], :include => :container)
      @navigation_entry_parent = @navigation_entry.parent
      @current_navigation_entry = @navigation_entry
      load_misc_stuffs
      @container = @navigation_entry.container
    end

    respond_to do |format|
      format.html # show.html.erb
      format.xml  { render :xml => @navigation_entry }
    end
  end

  # GET /navigation_entries/new
  # GET /navigation_entries/new.xml
  def new
    @navigation_entry = NavigationEntry.new

    respond_to do |format|
      format.html # new.html.erb
      format.xml  { render :xml => @navigation_entry }
    end
  end

  # GET /navigation_entries/1/edit
  def edit
    @navigation_entry = NavigationEntry.find(params[:id])
  end

  # POST /navigation_entries
  # POST /navigation_entries.xml
  def create
    @navigation_entry = NavigationEntry.new(params[:navigation_entry])

    respond_to do |format|
      if @navigation_entry.save
        format.html { redirect_to(@navigation_entry, :notice => 'Navigation entry was successfully created.') }
        format.xml  { render :xml => @navigation_entry, :status => :created, :location => @navigation_entry }
      else
        format.html { render :action => "new" }
        format.xml  { render :xml => @navigation_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # PUT /navigation_entries/1
  # PUT /navigation_entries/1.xml
  def update
    @navigation_entry = NavigationEntry.find(params[:id])

    respond_to do |format|
      if @navigation_entry.update_attributes(params[:navigation_entry])
        format.html { redirect_to(@navigation_entry, :notice => 'Navigation entry was successfully updated.') }
        format.xml  { head :ok }
      else
        format.html { render :action => "edit" }
        format.xml  { render :xml => @navigation_entry.errors, :status => :unprocessable_entity }
      end
    end
  end

  # DELETE /navigation_entries/1
  # DELETE /navigation_entries/1.xml
  def destroy
    @navigation_entry = NavigationEntry.find(params[:id])
    @navigation_entry.destroy

    respond_to do |format|
      format.html { redirect_to(navigation_entries_url) }
      format.xml  { head :ok }
    end
  end
end
