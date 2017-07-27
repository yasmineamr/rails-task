module ApplicationHelper

  def youtube_video(url)
  	regex = /(?:.be\/|\/watch\?v=|\/(?=p\/))([\w\/\-]+)/
  	id = url.match(regex)[1]
  	embed_url = "http://www.youtube.com/embed/" + id
    render :partial => 'videos/video', :locals => { :url => embed_url }
  end 
end
