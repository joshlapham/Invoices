# Invoices

By Josh Lapham [josh@joshlapham.com]

License: [Beerware](https://en.wikipedia.org/wiki/Beerware)

## What This Is

[Ruby on Rails](http://rubyonrails.org/) app for managing clients and invoices. Invoices can be exported to [PDF file](https://en.wikipedia.org/wiki/Portable_Document_Format).

## Setup

Tested on [Ruby](https://www.ruby-lang.org/en/) version `ruby 2.7.0p0 (2019-12-25 revision 647ee6f091) [x86_64-darwin18]`

Tested using `bundler` version `2.1.2`

__NOTE__ - Be sure to update the value for `secret_key_base` in `config/secrets.yml`

1. Ensure `wkhtmltopdf` is installed on OS:
    * Linux: `apt install wkhtmltopdf`
    * Mac: `brew install wkhtmltopdf`
2. Ensure [`bundler`]((https://github.com/bundler/bundler)) is installed: `gem install bundler`
3. Install dependencies: `bundle install`
4. (First run) Setup database: `bundle exec rake db:migrate`
5. Start app: `bundle exec rails server`

### Troubleshooting

- [`libreadline` error on OS X](http://stackoverflow.com/a/40174648)

- `An error occurred while installing nokogiri (1.10.9), and Bundler cannot continue.`
  - Check logfile: `~/.rvm/gems/ruby-2.7.0/extensions/x86_64-linux/2.7.0/nokogiri-1.10.9/mkmf.log`
  - Look for line: `gcc: error: unrecognized command line option '-Wduplicated-cond'`
  - Run: `which gcc`
  - If path is Homebrew, then run: `brew unlink gcc`
