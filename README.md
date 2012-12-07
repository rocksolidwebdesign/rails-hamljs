## Haml JavaScript (JST) Templates for Rails

Lets you use https://github.com/creationix/haml-js templates in the Rails asset pipeline.

No need to download haml.js, this gem includes the haml.js file for you.

* Requires ExecJS

## Why another Haml-JS gem?

Simply put the others are/were broken or have issues.

Features

  * Actually works
  * ExecJS compile (should integrate with precompilation of assets)
  * Usable template variables

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
