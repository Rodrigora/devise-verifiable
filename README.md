# DeviseVerifiable

[![Gem Version](https://badge.fury.io/rb/devise-verifiable.svg)](https://badge.fury.io/rb/devise-verifiable)

DeviseVerifiable adds a second step to registration process.

This is useful to register users with additional information or verify the users
identity through a third-party service such as BlockScore.


## Instalation

Simply add DeviseVerifiable to your application's Gemfile:

```
gem 'devise'
gem 'devise-verifiable'
```

## Configuration

DeviseVerifiable adds a configuration variable called
`fields_for_verification`. It configures which fields will be filled in the verification step:

```ruby
Devise.setup do |config|
  config.fields_for_verification = [:full_name, :address]
end
```

To include DeviseVerifiable in a model, add the `verifiable`
module to Devise modules:

```ruby
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :verifiable
end
```


If you have multiple models configured with devise, define the fields for verification individually using the `verify_fields` method:

```ruby
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :verifiable

  verify_fields :full_name, :address
end
```

To restrict unverified users from access certain pages, use the helper
`:authenticate_verified_user!`:

```ruby
class HomeController < ApplicationController
  # Only verified users will have access to home controller actions
  before_action :authenticate_verified_user!

  # ...
end
```


## Model

DeviseVerifiable will add some methods to your model:

**#verified?** -> this method will check if all fields used for verification are
filled.

```ruby
user = User.new

user.verified? # => false

user.full_name = 'Rodrigo Ra'
user.address = '555, Atomic Avenue'

user.verified? # => true
```

**#valid_for_verification?** -> this method will validate all fields used for
verification and add errors messages for invalid fields. By default, it verifies
if the fields are `blank?`


```ruby
user = User.new

user.valid_for_verification? # => false
user.errors # => # <ActiveModel::Errors:0x007fe372bcc200 @base=...,
                 # @messages={:full_name=>["can't be blank"],
                 #            :address=>["can't be blank"]}>

user.full_name = 'Rodrigo Ra'
user.address = '555, Atomic Avenue'

user.valid_for_verification? # => true
user.errors.empty? # => true
```

**#validate_for_verification** -> You can customize the validation for fields.

Let's say that you need validate the `zip_code`:

```ruby
class User < ActiveRecord::Base
  devise :database_authenticatable, :registerable, :verifiable

  verify_fields :full_name, :address, :zip_code

  protected
    def validate_for_verification(field)
      if field == :zip_code
        # custom validation for zip_code
      else
        super
      end
    end
end
```

## Customizing the verification

To use a third-party service to verify the user identity.

### View
To customize the verification view, following the devise conventions, create a file in
`app/views/devise/verification` called `new.html.erb`.

### Controller

First, configure which controller you want to use in `config/routes.rb`:

    devise_for :users, controllers: { verification: :custom_verification }


And create it (in this example, CustomVerificationController):

```ruby
class CustomVerificationController << Devise::VerificationController

  def new
  end

  def create
  end

end
```

## Example

[This app](https://github.com/Rodrigora/devise-verifiable-example) exemplifies the usage of this gem.


## Contributing

Questions or problems? Please post them on the [issue tracker](https://github.com/Rodrigora/devise-verifiable/issues).

You can contribute by doing the following:

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request

To test the application run `bundle install` and then `rake test`.

## License

MIT License.
