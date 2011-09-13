class CmsGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  #admin routes
  def admin_routes
    line = "::Application.routes.draw do"
    gsub_file 'config/routes.rb', /(#{Regexp.escape(line)})/mi do |match|
      "#{match}\n  scope :path => \"admin\" do\n  end"
    end
  end
  #User related files
  def copy_user_files
    copy_file "users_controller.rb", "app/controllers/users_controller.rb"
    copy_file "user.rb", "app/models/user.rb"
    copy_file "devise_create_users.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M%S")}_devise_create_users.rb"
    line = "::Application.routes.draw do"
    #gsub_file 'config/routes.rb', /(#{Regexp.escape(line)})/mi do |match|
    #  "#{match}\n  devise_for :users\n"
    #end
    line = "scope :path => \"admin\" do"
    gsub_file 'config/routes.rb', /(#{Regexp.escape(line)})/mi do |match|
      "#{match}\n    resources :users\n"
    end
  end

  #content
  def copy_content_files
    copy_file "content_wrappers_controller.rb", "app/controllers/content_wrappers_controller.rb"
    copy_file "content_wrapper.rb", "app/models/content_wrapper.rb"
    copy_file "create_content_wrappers.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M%S")}_create_content_wrappers.rb"
    FileUtils.cp_r 'lib/generators/cms/templates/content_wrappers/','app/views/content_wrappers/'
    copy_file "content_wrapper_contents_controller.rb", "app/controllers/content_wrapper_contents_controller.rb"
    copy_file "content_wrapper_content.rb", "app/models/content_wrapper_content.rb"
    FileUtils.cp_r 'lib/generators/cms/templates/content_wrapper_contents/','app/views/content_wrapper_contents/'
    copy_file "content_extension.rb", "app/models/content_extension.rb"
    copy_file "content_methods.rb", "app/models/content_methods.rb"
  end

  #container
  def copy_container_files
    copy_file "containers_controller.rb", "app/controllers/containers_controller.rb"
    copy_file "container.rb", "app/models/container.rb"
    FileUtils.cp_r 'lib/generators/cms/templates/containers/','app/views/containers/'
    copy_file "container_contents_controller.rb", "app/controllers/container_contents_controller.rb"
    copy_file "container_content.rb", "app/models/container_content.rb"
    FileUtils.cp_r 'lib/generators/cms/templates/container_contents/','app/views/container_contents/'
  end

  #contact
  def copy_contact_files
    copy_file "contacts_controller.rb", "app/controllers/contacts_controller.rb"
    copy_file "contact.rb", "app/models/contact.rb"
    FileUtils.cp_r 'lib/generators/cms/templates/contacts/','app/views/contacts/'
  end

  #messages
  def copy_message_files
    copy_file "messages_controller.rb", "app/controllers/messages_controller.rb"
    copy_file "message.rb", "app/models/message.rb"
    FileUtils.cp_r 'lib/generators/cms/templates/messages/','app/views/messages/'
  end

  #products
  def copy_product_files
    copy_file "products_controller.rb", "app/controllers/products_controller.rb"
    copy_file "product.rb", "app/models/product.rb"
    FileUtils.cp_r 'lib/generators/cms/templates/products/','app/views/products/'
    copy_file "product_families_controller.rb", "app/controllers/product_families_controller.rb"
    copy_file "product_family.rb", "app/models/product_family.rb"
    FileUtils.cp_r 'lib/generators/cms/templates/product_families/','app/views/product_families/'
    copy_file "product_thumbnails_controller.rb", "app/controllers/product_thumbnails_controller.rb"
    copy_file "product_thumbnail.rb", "app/models/product_thumbnail.rb"
    FileUtils.cp_r 'lib/generators/cms/templates/product_thumbnails/','app/views/product_thumbnails/'
  end

  #helpers
  def copy_helpers
    directory "helpers","app/helpers"
  end
end
