# -*- encoding: utf-8 -*-
# stub: rails_pdate 0.0.4 ruby lib

Gem::Specification.new do |s|
  s.name = "rails_pdate".freeze
  s.version = "0.0.4"

  s.required_rubygems_version = Gem::Requirement.new(">= 0".freeze) if s.respond_to? :required_rubygems_version=
  s.require_paths = ["lib".freeze]
  s.authors = ["Mohsen Alizadeh".freeze]
  s.date = "2016-09-14"
  s.description = "persian date support for ruby on rails.".freeze
  s.email = ["mohsen@alizadeh.us".freeze]
  s.homepage = "https://github.com/mohsen-alizadeh/rails-pdate".freeze
  s.rubygems_version = "3.0.3".freeze
  s.summary = "persian date support for ruby on rails.".freeze

  s.installed_by_version = "3.0.3" if s.respond_to? :installed_by_version

  if s.respond_to? :specification_version then
    s.specification_version = 4

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_runtime_dependency(%q<rails>.freeze, [">= 4.0.0"])
    else
      s.add_dependency(%q<rails>.freeze, [">= 4.0.0"])
    end
  else
    s.add_dependency(%q<rails>.freeze, [">= 4.0.0"])
  end
end
