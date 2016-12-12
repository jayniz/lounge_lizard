# Lounge Lizard [![Circle CI](https://circleci.com/gh/moviepilot/lounge_lizard/tree/master.svg?style=shield)](https://circleci.com/gh/moviepilot/lounge_lizard/tree/master) [![Coverage Status](https://coveralls.io/repos/moviepilot/lounge_lizard/badge.svg?branch=master&service=github)](https://coveralls.io/github/moviepilot/lounge_lizard?branch=master)

![](https://cloud.githubusercontent.com/assets/3609616/21100043/238d67cc-c072-11e6-9f4e-252e9cb1ae19.jpg)

A small [drafter](https://github.com/apiaryio/drafter) binding. As [redsnow](https://github.com/apiaryio/redsnow)
is outdated and deprecated, we implemented a binding for the parsing method of drafter.

The drafter version used by the current Lounge Lizard version is 3.2.2

### Drafter

This is just wrapper to use Drafter. Check [drafter's repository](https://github.com/apiaryio/drafter) for more info

## Install

```sh
$  gem install lounge_lizard
```

## Usage
`LoungeLizard.parse(mson_file)` will return a hash representing the AST of the mson file.

You can also call the c++ function directly. For an example, just check `lib/lounge_lizard.rb`:

`LoungeLizard.drafter_parse_blueprint_to(mson_file, ffi_pointer, options_struct)`

## Build

1. Clone the repo + fetch the submodules(this is, drafter and its dependencies):

    ```sh
    $ git clone git://github.com/moviepilot/lounge_lizard.git
    $ cd lounge_lizard
    $ git submodule update --init --recursive
    ```

2. Lounge Lizard has drafter as a native extension. This meaning, drafter is 
a c++ library you need to compile it before using it. `rake` will take care of 
compiling it:

    ```sh
    $ rake
    ```

## Credit

The way this gem is build is very similar to [redsnow](https://github.com/apiaryio/redsnow).
It just provides a binding, but it's up to date

## License
MIT License. See the [LICENSE](https://github.com/moviepilot/lounge_lizard/blob/master/LICENSE) file.
