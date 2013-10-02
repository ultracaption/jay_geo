JayGeo
======

Introduction
------------

JayGeo is a sinatra app wrapping [MaxMind](http://maxmind.com)'s GeoIP City
database. Based on [geoip](https://github.com/cjheath/geoip) gem, it provides
pure Ruby implementation of reverse geocoding provider available for
self-hosting.

Requirements
------------

  - Ruby 1.9.3 (Tested and developed on it)
  - Bundler

Setup
-----

  1. Install required gems with Bundler.

        $ bundle install

  2. Download and locate GeoIP City database under project directory>

        ${JAY_GEO_HOME}/geoip_databases/GeoIPCity.dat

  3. Create `${JAY_GEO_HOME}/config/application.rb` for mandatory
     configuration.

        JayGeo::GeoIp.configure('geoip_databases/GeoIPCity.dat')

Usage
-----

Execute `unicorn` to run the server.

    bundle exec unicorn

After the server boots up, you can query via `GET /find` API.

    GET /find?q=[query]
