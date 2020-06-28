# Invoices

By Josh Lapham [josh@joshlapham.com]

License: [Beerware](https://en.wikipedia.org/wiki/Beerware)

## What This Is

[Ruby on Rails](http://rubyonrails.org/) app for managing clients and invoices. Invoices can be exported to [PDF file](https://en.wikipedia.org/wiki/Portable_Document_Format).

## Setup

Tested on [Ruby](https://www.ruby-lang.org/en/) version `ruby 2.7.0p0 (2019-12-25 revision 647ee6f091) [x86_64-darwin18]`

__NOTE__ - ensure [`bundler`](https://github.com/bundler/bundler) is installed - `gem install bundler`

__NOTE 2__ - be sure to update the value for `secret_key_base` in `config/secrets.yml`

1. Install dependencies: `bundle install`
2. (First run) Setup database: `bundle exec rake db:migrate`
3. Start app: `bundle exec rails server`

### Troubleshooting

- `libreadline` error on OS X: http://stackoverflow.com/a/40174648
