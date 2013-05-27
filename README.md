# ActsAsStatable

This gem creates charts based on a Mongoid Model. It's based on ChartKick for example.

## Installation

Add this line to your application's Gemfile:

    gem 'acts_as_statable'

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install acts_as_statable

## Usage

Works with Mongoid only

Add this in your model :

    include Mongoid::Timestamps
    include ActsAsStatable


Add this in your layout

    <%= javascript_include_tag "//www.google.com/jsapi", "chartkick" %>

Add this in your view :

    <%= line_chart_model User %> # Group by date and created at automatically
    <%= line_chart User.group_by_date(:created_at) %>


## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
