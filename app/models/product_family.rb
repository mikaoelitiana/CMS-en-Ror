class ProductFamily < ActiveRecord::Base
  extend ContentExtension
  has_many :products
  has_friendly_id :name, :approximate_ascii => true, :use_slug => true
  has_one :navigation_entry, :as => :public_viewable, :dependent => :destroy
  has_ancestry :cache_depth => true

  after_save :update_navigation_entry

  private
  def update_navigation_entry
    nav_parent = self.parent ? self.parent.navigation_entry : NavigationEntry.find_by_name("Produits")
    container = Container.find_by_name("Global")
    my_navigation_entry = NavigationEntry.where(:public_viewable_id => self[:id], :public_viewable_type => "ProductFamily").first
    if my_navigation_entry
      self.navigation_entry.name = self.name
      self.navigation_entry.text = self.name
      self.navigation_entry.parent = nav_parent
      self.navigation_entry.save
    else
      self.create_navigation_entry :name => self.name, :text => self.name, :title => "Voir la famille de produits #{self.name}", :parent => nav_parent, :container => container
    end
  end
end
