This repo doesn't have a cassette generated.

To reproduce the bug:

    bundle exec rspec spec/the_spec.rb
    bundle exec rspec spec/the_spec.rb

This will succeed the first time, fail the second time.
