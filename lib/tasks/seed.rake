namespace :gap do

  desc 'Seeds database'
  task 'seed' => :environment do |t, args|
    # Admins
    puts 'Creating default admin users...'
    DEFAULT_ADMINS.each do |user|
      User.where(email: user['email'], admin: true).first_or_create
    end
    puts 'Admins created'

    # Videos
    puts 'Creating default videos...'
    DEFAULT_VIDEOS.each do |video|
      Video
        .where(title: video['title'],
          link: video['link'],
          description: video['description'],
          presenter: video['presenter'],
          tags: video['tags'])
        .first_or_create
    end
    puts 'Videos created'

  end
end
