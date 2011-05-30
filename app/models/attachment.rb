class Attachment < ActiveRecord::Base

  belongs_to :buch
  
  mount_uploader :content, ContentUploader

end
