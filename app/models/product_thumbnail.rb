class ProductThumbnail < ActiveRecord::Base
  validates_presence_of :name
  belongs_to :product
  has_attached_file :image
  validates_attachment_presence :image
end
