class ContentWrapperContent < ActiveRecord::Base
  include ContentMethods
  include ContentWrapperMethods
  belongs_to :content_wrapper
  belongs_to :content, :polymorphic => true
end
