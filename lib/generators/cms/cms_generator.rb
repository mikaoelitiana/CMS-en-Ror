class CmsGenerator < Rails::Generators::NamedBase
  source_root File.expand_path('../templates', __FILE__)

  #User related files
  def copy_user_files
    copy_file "users_controller.rb", "app/controllers/users_controller.rb"
    copy_file "user.rb", "app/models/user.rb"
    copy_file "devise_create_users.rb", "db/migrate/#{Time.now.strftime("%Y%m%d%H%M%S")}_devise_create_users.rb"
  end
end
