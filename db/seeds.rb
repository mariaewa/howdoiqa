env = (Rails.env == "staging") ? "development" : Rails.env
path = Rails.root.join('db', 'seeds', "#{env}.rb")

load path if File.exist?(path)
