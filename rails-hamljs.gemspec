Gem::Specification.new do |s|
  s.name = "rails-hamljs"
  s.version = "0.0.1"
  s.summary = "Haml JavaScript Templates"
  s.description = "Haml-JS templates in the Rails asset pipeline."

  s.files = Dir["README.md", "LICENSE", "lib/**/*.rb"]

  s.add_development_dependency "execjs", "~> 1.4.0"
  s.add_development_dependency "sprockets", "~> 2.1"
  s.add_development_dependency "tilt", "~> 1.3"

  s.authors = ["Vaughn Draughon"]
  s.email = ["vaughn@rocksolidwebdesign.com"]
  s.homepage = "https://github.com/rocksolidwebdesign/rails-hamljs/"
end
