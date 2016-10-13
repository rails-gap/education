namespace :gap do

  desc 'Seeds database'
  task 'seed' => :environment do |t, args|
    # Videos
    puts 'Creating default videos...'
    DEFAULT_VIDEOS.each do |video|
      Video
        .where(title: video['title'],
          link: video['link'],
          description: video['description'],
          tags: video['tags'])
        .first_or_create
    end
    puts 'Videos created'

  end
end
