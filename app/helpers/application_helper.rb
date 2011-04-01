module ApplicationHelper


  def file_preview(_file)
    case _file.content_type
    when /image/
      return image_tag(_file.url, :size => '48x48')
    else
      return image_tag('missing.png', :size => '48x48')
    end
  end
end
