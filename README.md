# drone-ci - A Ruby Interface to the Drone CI API

## Overview

`drone-ci` is a Ruby Gem that provides a client for Drone CI servers.

## Why does this exist?

Because I couldn't find one that existed. There's Go and JavaScript libraries, but Ruby deserves some love too.

## How do I obtain this majestic tool?

If you're using `bundler`, add the following to your `Gemfile`:

```ruby
gem 'drone-ci', '~> 0.1'
```

Otherwise, install it the usual way:

```shell
gem install drone-ci
```

## How do I use it?

`drone-ci` is primarily intended as a library, so you'll probably want to use it that way.

```ruby
#! /usr/bin/env ruby

require 'drone-ci'
require 'json'

drone = DroneCI::Client.new(server: "https://drone-server-goes-here", token: "access token goes here")
STDOUT.puts JSON.pretty_generate drone.user_info.body
```

Which would output something this this:

```json
{
  "id": 191,
  "login": "colstrom",
  "email": "chris@olstrom.com",
  "machine": false,
  "admin": true,
  "active": true,
  "avatar": "https://avatars.githubusercontent.com/u/469456?v=4",
  "syncing": false,
  "synced": 1662068210,
  "created": 1659728463,
  "updated": 1659728463,
  "last_login": 1660781210
}
```

If you don't pass in a server or a token, `drone-ci` will read `DRONE_SERVER` and `DRONE_TOKEN` from the environment. These are the same environment variables used by the Drone CLI.

### Exploration Mode

If you simply run the `drone-ci` command (installed with the gem), it will drop you into an interactive session where you can explore the API of your Drone server.

## License

`drone-ci` is available under the [MIT License](https://tldrlegal.com/license/mit-license). See `LICENSE.txt` for the full text.
