# -*- encoding : utf-8 -*-
module NavigationEntriesHelper
  def current_navigation_entry?(navigation_entry)
    @current_navigation_entry == navigation_entry || (navigation_entry.ancestry_depth > 0 && navigation_entry.descendants.include?(@current_navigation_entry))
  end

  def generated_link_to(navigation_entry, text = navigation_entry.text, id = nil)
    case navigation_entry.params_for_url
    when String
      link_to text, navigation_entry.params_for_url, :title => navigation_entry.title, :class => "a", :id => id
    when Hash
      link_to text, navigation_entry.params_for_url, :title => navigation_entry.title, :class => "a", :id => id
    when Array
      link_to text, public_navigation_entry_path(navigation_entry.params_for_url.first, navigation_entry.params_for_url.last), :title => navigation_entry.title, :class => "a", :id => id
    when ProductFamily
      link_to text, public_product_family_path(navigation_entry.params_for_url), :class => "a", :id => id
    when Product
      link_to text, public_product_path(navigation_entry.params_for_url.product_family, navigation_entry.params_for_url), :class => "a", :id => id
    when Partner
      link_to text, public_partner_path(navigation_entry.params_for_url), :class => "a", :id => id
    when Recipe
      link_to text, public_recipe_path(navigation_entry.params_for_url), :class => "a", :id => id
    else
      "<span title='#{navigation_entry.title}' class='a'#{id ? " id=#{id}" : ""}>#{text}</span>".html_safe
    end
  end
end
