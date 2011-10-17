class ContainerContent < ActiveRecord::Base
  include ContentMethods
  belongs_to :container
  belongs_to :content, :polymorphic => true
end
