# Where the I18n library should search for translation files
I18n.load_path += Dir[Rails.root.join('config', 'locales', '*.{rb,yml}').to_s]

# Permitted locales available for the application
I18n.available_locales = [:'zh-TW', :zh, :en]

# Set default locale to something other than :en
I18n.default_locale = 'zh-TW'