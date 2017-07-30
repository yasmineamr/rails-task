module ApplicationHelper

  def youtube_video(url)
  	regex = /(?:.be\/|\/watch\?v=|\/(?=p\/))([\w\/\-]+)/
  	id = url.match(regex)[1]
  	embed_url = "http://www.youtube.com/embed/" + id
    render :partial => 'videos/video', :locals => { :url => embed_url }
  end

  def error_messages_for(object)
    if object.errors.any?
      content_tag(:div, class: 'alert alert-danger') do
        content_tag :ul do
          object.errors.full_messages.each do |msg|
            concat content_tag(:li, msg)
          end
        end
      end
    end
  end

end
