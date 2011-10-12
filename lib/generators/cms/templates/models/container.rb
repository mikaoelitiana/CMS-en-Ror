class Container < ActiveRecord::Base
  validates_presence_of :name, :title
  validates_uniqueness_of :name
  has_friendly_id :title, :use_slug => true, :approximate_ascii => true
  has_many :navigation_entries, :dependent => :destroy
  has_many :container_contents
  has_many :sitelinks
end
