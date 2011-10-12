class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :prepare_all_contents
  before_filter :metatags
  before_filter :load_current_navigation_entry #, :unless => lambda { !dark_side? && self.controller_name != "containers" }
  before_filter :authenticate_user!, :if => Proc.new { |c| dark_side?(c) }

  def metatags(meta = { :title => "#{ self.controller_name.titleize } - #{ self.action_name.titleize }" })
    if @meta
      @meta.update(meta)
    else
      @meta = Meta.new(meta)
    end
  end

  def dark_side?(controller=self)
    controller.request.fullpath =~ /\/admin/
  end

  def load_current_navigation_entry
    if !dark_side? && self.controller_name != "containers"
      logger.info("*********** LOAD CURRENT NAVIGATION ENTRY *********")
      @current_navigation_entry ||= NavigationEntry.find_by_params(params)
      if @current_navigation_entry
        load_misc_stuffs
        logger.debug("********* #{@current_navigation_entry.name} and stuffs loaded ************")
      else
        logger.debug("********* NavigationEntry will be loaded in another place and stuffs loaded ************")
      end
    end
  end

  def load_misc_stuffs
    @container = @current_navigation_entry.container
    @header_illustrations = HeaderIllustration.for(@current_navigation_entry) unless fragment_exist?("header: #{@current_navigation_entry.name}")
    @side_text = SideText.for(@current_navigation_entry)
    if @current_navigation_entry.ancestry_depth > 1
      metatags :browser_title => "#{@current_navigation_entry.text} | #{@current_navigation_entry.parent.text}"
    else
      metatags :browser_title => @current_navigation_entry.text
    end
    load_sub_contents
  end

  helper_method :metatags, :dark_side?

  private
  def prepare_all_contents
    if Rails.env.development?
      ProductFamily
      Product
      ContentWrapper
      Recipe
      Contact
    end
  end

  def load_contents
    @contents_with_view = Rails.cache.fetch "contents_with_view" do
      contents_with_view = []
      Content.list.each do |c|
        views = c.views
        views.each do |view|
          c.all.each do |content|
            contents_with_view << [ content.name + "/" + view, "#{content.class.to_s}:#{content[:id]}:#{view}" ]
          end
        end
      end
      contents_with_view
    end
  end

  def load_sub_contents
    unless dark_side?
      @news_snippets = NewsSnippet.all( :limit => 5, :order => "updated_at DESC" ) unless fragment_exist?("news_snippet_slides")
      @last_recipe = Recipe.ordered_by_creation.last unless fragment_exist?("last_recipe")
      @product_thumbnails = Product.with_small_image.all( :limit => 5, :order => "updated_at DESC" ) unless fragment_exist?("product_thumbnail_slides")
    end
  end
end
