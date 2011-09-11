class CmsGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  #User related files
  def copy_user_files
    copy_file "users_controller.rb", "app/controllers/users_controller.rb"
    copy_file "user.rb", "app/models/user.rb"
    copy_file "devise_create_users.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M%S")}_devise_create_users.rb"
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
  def copy_contenaire_files
    copy_file "containers_controller.rb", "app/controllers/containers_controller.rb"
    copy_file "container.rb", "app/models/container.rb"
    FileUtils.cp_r 'lib/generators/cms/templates/containers/','app/views/containers/'
    copy_file "container_contents_controller.rb", "app/controllers/container_contents_controller.rb"
    copy_file "container_content.rb", "app/models/container_content.rb"
    FileUtils.cp_r 'lib/generators/cms/templates/container_contents/','app/views/container_contents/'
  end

end
