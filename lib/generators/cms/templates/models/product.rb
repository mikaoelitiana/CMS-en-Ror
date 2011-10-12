class Product < ActiveRecord::Base
  extend ContentExtension
  belongs_to :product_family
  belongs_to :partner
  belongs_to :origin
  #has_attached_file :illustration
  has_attached_file :diaporama

  has_attached_file :small_square
  has_attached_file :big_square
  has_attached_file :small_image
  has_attached_file :big_image, :styles => { :small => "308x140#" }

  has_friendly_id :name, :approximate_ascii => true, :use_slug => true

  has_many :product_thumbnails
  has_many :recipes

  has_one :navigation_entry, :as => :public_viewable, :dependent => :destroy

  scope :with_big_image, where(:big_image_file_name.not_eq => nil).where(:big_image_file_name.not_eq => "")
  scope :with_small_image, where(:big_image_file_name.not_eq => nil).where(:big_image_file_name.not_eq => "")
  default_scope :order => "`products`.`name` ASC"

  after_save :update_navigation_entry

  define_index do
    indexes :name, :sortable => true
    indexes description
    indexes flavour
    indexes usage
    indexes product_family(:name), :as => :product_family
    indexes partner(:name), :as => :partner
    indexes origin(:name), :as => :origin
  end

  private
  def update_navigation_entry
    parent = self.product_family.navigation_entry
    container = Container.find_by_name("Global")
    my_navigation_entry = NavigationEntry.where(:public_viewable_id => self[:id], :public_viewable_type => "Product").first
    if my_navigation_entry
      self.navigation_entry = my_navigation_entry
      self.navigation_entry.parent = parent
      self.navigation_entry.container = container
      self.navigation_entry.name = self.name
      self.navigation_entry.text = self.name
      self.navigation_entry.title = "Voir la fiche produit : #{self.name}"
      self.navigation_entry.save
    else
      self.create_navigation_entry :name => self.name, :text => self.name, :title => "Voir la fiche produit : #{self.name}", :parent => parent, :container => container
    end
  end
end
