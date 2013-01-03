## Haml JavaScript (JST) Templates for Rails

Lets you use https://github.com/uglyog/clientside-haml-js templates in the Rails asset pipeline.

No need to download haml.js, this gem includes the haml.js file for you.

* Requires ExecJS

## Why another Haml-JS gem?

Uglyog's library lets you use coffeescript, which allows the embedded JavaScript in your Haml templates to be much more beautiful and Ruby-like.

The other gems use creationix's library.

This gem actually hooks in to the asset pipeline to give you precompiled haml templates which are actually blazing fast for the user.

## Installation

Add this line to your `Gemfile`

    gem 'rails-hamljs', :git => 'git://github.com/rocksolidwebdesign/rails-hamljs'

## Usage

Simply add JST templates with an extension of `.haml` to your javascript templates directory

    app/assets/javascripts/templates/foo.jst.haml

And of course, be sure to

    //= require_tree ./templates

in the correct order so that the global `JST` variable is available.

Then, as with other JST templates such as ECO and EJS, you may access your templates from the `JST` object:

    var template = JST["templates/foo"];

    var htmlOutput = template({
      someVar: "someValue",
      someOtherVar: "someOtherVal"
    });

## TODO

Configuration:

  Toggle whose library to use (creationix or uglyog)
  Toggle coffeescript (if using uglyog's library)
