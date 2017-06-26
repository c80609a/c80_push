$:.push File.expand_path('../lib', __FILE__)

# Maintain your gem's version:
require 'c80_push/version'

# Describe your gem and declare its dependencies:
Gem::Specification.new do |s|
  s.name        = 'c80_push'
  s.version     = C80Push::VERSION
  s.authors     = ['C80609A']
  s.email       = ['c080609a@gmail.com']
  s.homepage    = 'https://github.com/c80609a/c80_push'
  s.summary     = 'Пушеры'
  s.description = 'Добавляет функционал дилеров и офисов продаж'
  s.license     = 'MIT'

  s.files = Dir['{app,config,db,lib}/**/*', 'MIT-LICENSE', 'Rakefile', 'README.md']

  s.add_dependency 'rails'#, '~> 5.1.1'

end
