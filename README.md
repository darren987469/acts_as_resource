# Resource
[![Build Status](https://travis-ci.org/darren987469/resource.svg?branch=master)](https://travis-ci.org/darren987469/resource)
[![Maintainability](https://api.codeclimate.com/v1/badges/8b9bf5b5fae1eb34a328/maintainability)](https://codeclimate.com/github/darren987469/resource/maintainability)
[![Coverage Status](https://coveralls.io/repos/github/darren987469/resource/badge.svg?branch=master)](https://coveralls.io/github/darren987469/resource?branch=master)

This gem is helpful to handle whether user has permission to access resources. Resource cab be project, document, etc.

## Installation

Add this line to your application's Gemfile:

```ruby
gem 'resource'
```

And then execute:

    $ bundle

Generate migration and run it

```shell
rails g resource:migration
rake db:migrate
```

## Usage

```ruby
class User < ActiveRecord::Base
  acts_as_accessable resources: [ :projects ]
end

class Project < ActiveRecord::Base
  acts_as_resource accessors: [ :users ]
end

user = User.create!
project = Project.create!

user.projects
# => [ ]
project.users
# => [ ]
user.can_access?(project)
# => false
project.accessible_by?(user)
# => false

user.projects << project # or project.users << user
user.projects
# => [ project ]
project.users
# => [ user ]
user.can_access?(project)
# => true
project.accessible_by?(user)
# => true

another_user = User.create!
another_user.can_access?(project)
# => false
```

## Development

After checking out the repo, run `bin/setup` to install dependencies. Then, run `rake spec` to run the tests. You can also run `bin/console` for an interactive prompt that will allow you to experiment.

To install this gem onto your local machine, run `bundle exec rake install`. To release a new version, update the version number in `version.rb`, and then run `bundle exec rake release`, which will create a git tag for the version, push git commits and tags, and push the `.gem` file to [rubygems.org](https://rubygems.org).

## Contributing

Bug reports and pull requests are welcome on GitHub at https://github.com/darren987469/resource. This project is intended to be a safe, welcoming space for collaboration, and contributors are expected to adhere to the [Contributor Covenant](http://contributor-covenant.org) code of conduct.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the Resource project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/darren987469/resource/blob/master/CODE_OF_CONDUCT.md).
