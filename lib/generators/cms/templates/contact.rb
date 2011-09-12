class Contact < ActiveRecord::Base
 extend ContentExtension
 validates_presence_of :name
 has_attached_file :logo_contact 
end
