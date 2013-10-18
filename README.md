# Lani

A new programming language in Rubinius. This is a project from the 2013 Rails Girls Summer of Code [http://www.railsgirlssummerofcode.org] by Team Rails Grrls [http://railsgrrls.tumblr.com or http://www.twitter.com/RailsGrrls @RailsGrrls]. We are beginners who are writing our own programming language in Rubinius and then writing a tutorial for beginners.

The documentation is traditionally bad for this topic, especially for beginners. Our goal is to change that! We want beginners to realize that they can write their own programming language and give them the tools and documentation to make it happen.

See the `examples` folder to get a feel for the language.

## Installation

After installing Rubinius, install Lani as a gem:

    $ gem install lani

## Usage

    $ lani -h

    $ lani
    ln> 3 + 3
    # => 6

    $ echo "3 + 3" > my_file.ln
    $ lani my_file.ln
    # => 6

## Development

To run the tests:

    $ rake test

To regenerate the lexer grammar:

    $ rake rexical:regenerate

To regenerate the parser grammar:

	$ rake racc:regenerate

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
