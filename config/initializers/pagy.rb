require 'pagy/extras/bootstrap'
require 'pagy/extras/overflow'
require 'pagy/extras/countless'

Pagy::I18n.load(locale: 'ru')
Pagy::DEFAULT[:items] = 25
Pagy::DEFAULT[:overflow] = :last_page
