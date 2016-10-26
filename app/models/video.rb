class Video < ActiveRecord::Base

  scope :active, -> { where(active: true) }

  self.per_page = 12

  def thumbnail
    "http://img.youtube.com/vi/#{video_id}/hqdefault.jpg"
  end

  def embedded_link
    link.gsub!('watch?v=', 'embed/')
  end

  private

  def video_id
    link.split('v=').last.split('?').first
  end

end
