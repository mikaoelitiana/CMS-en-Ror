# -*- encoding : utf-8 -*-
class NavigationEntry < ActiveRecord::Base
  KnownKeys = [ :product_family, :partner, :id, :product_family_id, :partner_id ] # + :controller, :action
  KnownActions = { "Page d'accueil" => "misc#welcome", "Tous les produits" => "product_families#all", "Contact" => "messages#new", "Recette du moment" => "recipes#last" }
  validates_presence_of :name
  validates_uniqueness_of :name
  validates_presence_of :text
  belongs_to :container
  has_ancestry :cache_depth => true
  has_many :header_illustrations
  has_many :sitelinks
  has_one :side_text, :dependent => :nullify

  belongs_to :public_viewable, :polymorphic => true

  before_save :update_full_names
  has_friendly_id :text, :use_slug => true, :approximate_ascii => true

  scope :visible, :conditions => { :visible => true }

  def self.find_by_params(params)
    action = NavigationEntry.create_action(params)
    NavigationEntry.find_by_action(action)
  end

  def self.create_action(params)
    action = "#{params[:controller]}##{params[:action]}"
    query = {}
    NavigationEntry::KnownKeys.each do |k|
      query[k] = params[k] if params[k]
    end
    action << "?#{query.to_query}" unless query.empty?
    action
  end

  def params_for_url(force_reload=false)
    return @params_for_url if (@params_for_url && !force_reload)
    if self.public_viewable
      @params_for_url = public_viewable
    elsif self.url && !self.url.blank?
      @params_for_url = self.url
    elsif self.action && !self.action.empty?
      url_params = {}
      controller, action_with_params = action.split("#")
      action, params = action_with_params.split("?")
      params.split("&").each do |param|
        url_params[param.split("=")[0].to_sym] = param.split("=")[1]
      end if params
      url_params[:controller] = "/#{controller}"
      url_params[:action] = action
      @params_for_url = url_params
    elsif self.container
      @params_for_url = [self.ancestors.all(:include => :container).map{ |n| n.to_param } - [ self.root.to_param ], self.to_param]
    end
    @params_for_url
  end

  protected
  def update_full_names(parent_full_name = (self.parent ? self.parent.full_name : nil))
    self.full_name = ""
    self.full_name << "#{parent_full_name}/" if parent_full_name
    self.full_name <<  "#{self.position}-#{self.name}"
    self.descendants.find_each do |d|
      d.update_full_names(self.full_name)
      d.save
    end unless self.new_record?
  end
end
