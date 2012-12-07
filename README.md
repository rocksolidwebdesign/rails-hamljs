## Haml Templates for JavaScript

Makes haml-js from

https://github.com/creationix/haml-js

available for jst templates in the sprockets pipeline

No need to download, this gem includes the haml.js file for you

## Why another Haml-JS gem?

Simply put the others are/were broken.

Features

  * Actually works
  * Actual ExecJS compile (should integrate with precompilation of assets)
  * Usable template variables

## Installation

    gem install rails-hamljs

## Usage

Simply add JST templates with an extension of `.haml` to your javascript templates directory

    app/assets/javascripts/templates/foo.jst.haml

And of course, be sure to

    //= require_tree ./templates

in the correct order so that the global `JST` variable is available.
