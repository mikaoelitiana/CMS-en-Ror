class CmsGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)
  @@i = 0
  #installation de tierces plugins
  def install_3rd_party
    print("Installation de librairies tierces...\n")
    add_source 'http://gemcutter.org'
    add_source "http://gems.github.com"
    gem "devise"
    gem 'haml'
    gem 'haml-rails'
    gem 'friendly_id'
    gem 'stringex'
    gem 'compass'
    gem 'html5-boilerplate'
    gem 'simple_form'
    gem 'validation_reflection'
    gem 'paperclip'
    gem 'ancestry'
    #gem 'mysql2', '~> 0.2.0'
    #gem 'mysql2'
    gem 'devise'
    gem 'thinking-sphinx'
    gem 'kaminari'
    gem 'jquery-rails'
    gem 'webrat', :group => :test
    gem 'capistrano', :group => :test
    gem 'sqlite3', :group => :test
    gem 'mongrel', :group => :test
    #gem 'meta_where', :git => "git://github.com/ernie/meta_where.git"
    print("Execution de bundle install...\n")
    run "bundle check"
    run "bundle install"
  end

  #User related files
  def copy_user_files
    print("Copie des fichiers ...\n")
    @@i += 1
    copy_file "users_controller.rb", "app/controllers/users_controller.rb"
    copy_file "user.rb", "app/models/user.rb"
    copy_file "devise_create_users.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M%S")}#{@@i}_devise_create_users.rb"
    FileUtils.cp_r 'lib/generators/cms/templates/users/','app/views/users/'
  end

  #content
  def copy_content_files
    @@i += 1
    copy_file "content_wrappers_controller.rb", "app/controllers/content_wrappers_controller.rb"
    copy_file "content_wrapper.rb", "app/models/content_wrapper.rb"
    copy_file "create_content_wrappers.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M%S")}#{@@i}_create_content_wrappers.rb"
    FileUtils.cp_r 'lib/generators/cms/templates/content_wrappers/','app/views/content_wrappers/'
    @@i += 1
    copy_file "content_wrapper_contents_controller.rb", "app/controllers/content_wrapper_contents_controller.rb"
    copy_file "content_wrapper_content.rb", "app/models/content_wrapper_content.rb"
    copy_file "create_content_wrapper_contents.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M%S")}#{@@i}_create_content_wrapper_contents.rb"
    FileUtils.cp_r 'lib/generators/cms/templates/content_wrapper_contents/','app/views/content_wrapper_contents/'
    copy_file "content_extension.rb", "app/models/content_extension.rb"
    copy_file "content_methods.rb", "app/models/content_methods.rb"
    copy_file "free_contents_controller.rb", "app/controllers/free_contents_controller.rb"
    copy_file "free_content.rb", "app/models/free_content.rb"
    @@i += 1
    copy_file "create_free_contents.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M%S")}#{@@i}_create_free_contents.rb"
  end

  #container
  def copy_container_files
    copy_file "containers_controller.rb", "app/controllers/containers_controller.rb"
    copy_file "container.rb", "app/models/container.rb"
    FileUtils.cp_r 'lib/generators/cms/templates/containers/','app/views/containers/'
    @@i += 1
    copy_file "create_containers.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M%S")}#{@@i}_create_containers.rb"
    copy_file "container_contents_controller.rb", "app/controllers/container_contents_controller.rb"
    copy_file "container_content.rb", "app/models/container_content.rb"
    FileUtils.cp_r 'lib/generators/cms/templates/container_contents/','app/views/container_contents/'
    @@i += 1
    copy_file "create_container_contents.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M%S")}#{@@i}_create_container_contents.rb"
  end

  #contact
  def copy_contact_files
    @@i += 1
    copy_file "contacts_controller.rb", "app/controllers/contacts_controller.rb"
    copy_file "contact.rb", "app/models/contact.rb"
    FileUtils.cp_r 'lib/generators/cms/templates/contacts/','app/views/contacts/'
  end

  #messages
  def copy_message_files
    @@i += 1
    copy_file "messages_controller.rb", "app/controllers/messages_controller.rb"
    copy_file "message.rb", "app/models/message.rb"
    FileUtils.cp_r 'lib/generators/cms/templates/messages/','app/views/messages/'
  end

  #navigation
  def copy_navigation_files
    @@i += 1
    copy_file "navigation_entries_controller.rb", "app/controllers/navigation_entries_controller.rb"
    copy_file "navigation_entry.rb", "app/models/navigation_entry.rb"
    FileUtils.cp_r 'lib/generators/cms/templates/file:///home/mika/Documents/workspace/nature/app/views/navigation_entries
es/','app/views/file:///home/mika/Documents/workspace/nature/app/views/navigation_entries
es/'
  end
  #misc
  def copy_misc_files
    @@i += 1
    copy_file "misc_controller.rb", "app/controllers/misc_controller.rb"
    FileUtils.cp_r 'lib/generators/cms/templates/misc/','app/views/misc/'
  end

  #products
  def copy_product_files
    @@i += 1
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

   #admin routes
  def admin_routes
    print("Generation des routes ...\n")
    route("resources :messages, :only => [ :new, :create ]
  #devise_for :users")
    route("scope :path => \"admin\" do
      resources :sitelinks
      resources :illustrated_texts
      resources :step_groups
      resources :origins
      resources :side_texts
      resources :partners
      resources :free_contents
      resources :users
      resources :recipes
      resources :contacts
      resources :product_thumbnails
      resources :news_snippets
      resources :products
      resources :product_families
      resources :header_illustrations
      resources :navigation_entries
      resources :users, :content_wrappers, :containers
      resources :content_wrappers, :only => [ :show ] do
       resources :content_wrapper_contents
      end
      resources :content_wrapper_contents, :except => [ :new, :create ]
      resources :container_contents, :except => [ :new, :create ]
      resources :containers, :only => [ :show ] do
       resources :container_contents
      end
    end")
  end

  #devise
  def install_devise
    run("rails generate devise:install")
  end
  #migrate
  def migration
    print("Migration des schemas de base de donnees...\n")
    rake("db:migrate", :env => :development)
  end
end
