# Gcp::Vision

Google Cloud Platform Vision API Simple Client

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'gcp-vision'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install gcp-vision

## Usage

```ruby
Gcp::Vision.configure do |config|
  config.api_key = "your API KEY"
end

params = {
  requests: [
    {
      image:{
        content: Base64.encode64(File.read("first.png"))
      },
      features: [
        {
          type: "LABEL_DETECTION",
          maxResults: 10
        },
        {
          type: "IMAGE_PROPERTIES",
          maxResults: 10
        }
      ]
    },
    {
      image:{
        content: Base64.encode64(File.read("second.png"))
      },
      features: [
        {
          type: "LABEL_DETECTION",
          maxResults: 10
        },
        {
          type: "IMAGE_PROPERTIES",
          maxResults: 10
        }
      ]
    }
  ]
}

result = Gcp::Vision.annotate_image(params)

result.responses[0] # first.png Annotation
result.responses[1] # second.png Annotation
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/[USERNAME]/gcp-vision. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.


## License

The gem is available as open source under the terms of the [MIT License](http://opensource.org/licenses/MIT).

