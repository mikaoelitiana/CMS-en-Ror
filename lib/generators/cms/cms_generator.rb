class CmsGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  #User related files
  def copy_user_files
    copy_file "users_controller.rb", "app/controllers/users_controller.rb"
    copy_file "user.rb", "app/models/user.rb"
    copy_file "devise_create_users.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M%S")}_devise_create_users.rb"
  end

  #content wrappers
  def copy_content_wrapper_files
    copy_file "content_wrappers_controller.rb", "app/controllers/content_wrappers_controller.rb"
    copy_file "content_wrapper_content.rb", "app/models/content_wrapper_content.rb"
    copy_file "create_content_wrappers.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M%S")}_create_content_wrappers.rb"
    FileUtils.cp_r 'lib/generators/cms/templates/content_wrappers/','app/views/content_wrappers'
  end
end
