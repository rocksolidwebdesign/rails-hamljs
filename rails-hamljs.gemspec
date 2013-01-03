Gem::Specification.new do |s|
  s.name = "rails-hamljs"
  s.version = "0.0.1"
  s.summary = "Haml JavaScript Templates"
  s.description = ""

  s.description = <<-EOF
Clientide Haml JS templates for rails that \"just work\" (like they should).

Why another Haml JavaScript gem?

Uglyog's library lets you use coffeescript, which allows the embedded JavaScript in your Haml templates to be much more beautiful and Ruby-like. While I'm not the biggest fan of coffeescript for actual javascript coding, it's the perfect solution for haml templates.

The gem hooks in to the asset pipeline, convention over configuration style, very similar to the EJS gem, to give you precompiled haml templates which are actually blazing fast for the user and should be perfectly compatible with precompiled assets in production environments.
EOF

  s.files = Dir["README.md", "LICENSE", "lib/**/*.rb", "vendor/**/*.js"]

  s.add_dependency "sprockets", "~> 2.1"
  s.add_dependency "tilt", "~> 1.3"
  s.add_dependency "execjs", "~> 1.4.0"
  s.add_dependency "coffee-script", "~> 2.2"

  s.authors = ["Vaughn Draughon"]
  s.email = ["vaughn@rocksolidwebdesign.com"]
  s.homepage = "https://github.com/rocksolidwebdesign/rails-hamljs/"
end
