# -*- encoding : utf-8 -*-
module ContentExtension
  def self.extended(base)
    Content.register(base)
    base.class_eval do
      validates_presence_of :name
      validates_uniqueness_of :name
      has_many :container_contents, :as => :content, :dependent => :destroy
      has_many :containers, :through => :container_contents
      has_many :content_wrappers, :through => :content_wrapper_contents
      has_many :content_wrapper_contents, :as => :content, :dependent => :destroy
      after_save :refresh_contents_with_view

      def views
        Content.list_views_for(self.class)
      end
      private
      def refresh_contents_with_view
        Rails.cache.delete "contents_with_view"
      end
    end
  end

  def register_other_views(*views)
    Content.register_views_for(self, views)
  end

  self.class_eval do
    def views
      Content.list_views_for(self)
    end
  end
end
