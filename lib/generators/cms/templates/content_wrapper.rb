class ContentWrapper < ActiveRecord::Base
  extend ContentExtension
  include ContentWrapperMethods
  has_many :content_wrapper_contents
end
