begin
  defaults = YAML.load_file("#{Rails.root}/config/defaults.yml")
  DEFAULT_VIDEOS = defaults['videos']
  DEFAULT_ADMINS = defaults['admins']
rescue Errno::ENOENT, Psych::SyntaxError
  Rails.logger.error 'An error occured while loading defaults.yml'
end
DEFAULT_VIDEOS ||= []
