class Video < ActiveRecord::Base

  scope :active, -> { where(active: true) }

  self.per_page = 12

  def self.search(search_terms)
    active.where('title LIKE ?', "%#{search_terms}%")
  end

  def thumbnail
    "http://img.youtube.com/vi/#{video_id}/hqdefault.jpg"
  end

  def embedded_link
    link.gsub!('watch?v=', 'embed/')
  end

  def short_date
    date ? date.strftime('%B, %Y') : 'No date'
  end

  private

  def video_id
    link.split('v=').last.split('?').first
  end

end
