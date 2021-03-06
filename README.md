# Will Toggle

This gem is intended to clean up RoR views for jQuery toggling between hidden and visible elements.

```ruby
  <%= will_toggle label: 'Change Your Password', 
                  partial: 'users/password_fields', 
                  checked: false, 
                  locals: { f: f } %>
```

Just like that, you now have a `check_box_tag` that will display the `password_fields` partial when checked, and hide it from view when unchecked.  This becomes very handy in complex forms when you want to hide certain fields from a user until they actively enable a feature.


## How does it work?

A `check_box_tag` is added with `label_tag 'Change Your Password'`.  The checkbox is wired in to the `onchange` event, which triggers a jQuery function to toggle a `will-toggle-wrapper` that encapsulates the partial.  Will Toggle allows you to abstract out the javascript functions, div wrappers, and other view elements so that your HTML/ERB/HAML is simple and organized.

__Currently will\_toggle only supports a checkbox or radio button toggle, however, you can expect many more implementations to come.__


## Installation

Add this line to your application's Gemfile:

    gem 'will_toggle'

And then execute:

    $ bundle install

Or, install it yourself as:

    $ gem install will_toggle

In your application.js, you will have to include will\_toggle's scripts with:

    //= require will_toggle

## Usage

A minimalist:
```ruby
  <%= will_toggle label: 'Change Your Password', partial: 'users/password_fields', locals: { f: f } %>
```
  
All the bells and whistles:
```ruby
  <%= will_toggle label: 'Add Your Twitter Account', 
                  partial: 'users/fields/twitter', 
                  checked: false, 
                  clear_data: true, 
                  locals: { f: f } %>
```

### Available options:

  - `label`: the string you will use to describe the toggled div, i.e. show details.
  - `checked`: true or false, defaults to false. Specifies whether the checkbox will be checked.
  - `locals`: a hash of necessary variables for your partial.
  - `clear_data`: true or false, defaults to false. If true, the toggle function will clear any values in any child `text_field` upon toggle. Especially useful for optional form fields.

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Added some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

## Acknowledgements

This gem is inspired by [will\_paginate](https://www.github.com/mislav/will_paginate)
