# -*- encoding : utf-8 -*-
module Content
  @@registry = {}
  def self.register(type)
    @@registry[type] = [ type.to_s.underscore ]
  end
  def self.register_views_for(type, *views)
    @@registry[type] += views
  end
  def self.list
    @@registry.keys
  end
  def self.symbol_list
    @@registry.keys.map{ |k| k.to_s.tableize.to_sym }
  end
  def self.list_views_for(type)
    @@registry[type]
  end
end
