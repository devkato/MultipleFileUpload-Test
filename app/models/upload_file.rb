class UploadFile < ActiveRecord::Base

  default_scope :order => "created_at DESC"
  paginates_per 10

  #has_attached_file :file, :styles => { :thumb =>  { :geometry => 'x60',
  #  :quality => 70,
  #  :format => 'JPG'}
  #}
  has_attached_file :file
  

  validates_attachment_presence :file
  validates_attachment_size :file, :less_than => 10.megabytes
  #validates_attachment_content_type :file, :content_type => [ 'image/jpeg', 'image/png', 'image/pjpeg' ]
  MAX_CROP_WIDTH = 500
  PREVIEW_WIDTH  = 100
  PREVIEW_HEIGHT = 100
end
