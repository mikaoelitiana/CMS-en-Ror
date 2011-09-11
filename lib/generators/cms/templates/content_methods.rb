module ContentMethods
  def self.included(base)
    base.class_eval do
      validates_presence_of :content_view, :content_with_view
      default_scope :order => "`position` ASC"
    end
  end

  def content_with_view
    "#{self.content_type}:#{self.content_id}:#{self.content_view}"
  end

  def content_with_view=(content_with_view)
    content_type, content_id, content_view = content_with_view.split(":")
    self.content = content_type.constantize.find(content_id)
    self.content_view = content_view
  end
end
