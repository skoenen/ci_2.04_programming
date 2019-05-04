# Guide to View Slides

This guide is meant for those who have access to a Linux CLI either on
arch-linux on virtual box, ubuntu cli for windows or dual boot windows/linux
system.

Also this guide assumes you must have a
[clone](https://help.github.com/en/articles/cloning-a-repository) or download
of the project on your pc.

## Install Ruby

Firstly you need to install from the cli using the following commands:

- Ubuntu
  1. `$ sudo apt update`
  2. `$ sudo apt install ruby-full`
- ArchLinux
  1. `$ sudo pacman -Syu`
  2. `$ sudo pacman -S ruby`

To verify that the installation it was successful run the following command
which will print the Ruby version:

`$ ruby --version`

The output will look something like this:

`ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux-gnu]`

Important is the first part `ruby 2.5.1...`

### Install maybe needed tools required by __GEMS__

Finally, for some reason ruby development tools doesn't seem to come with the
full installation done above so we have to manually install all of them with
the following command:

- Ubuntu
  - `$ sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev
    libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev
    libcurl4-openssl-dev python-software-properties libffi-dev`

## Install Rake

Rake is an task runner.
The actions to run are defined in the `Rakefile` (capitalization is important).

To run the _SlideServer_ and to be able to look at the slides, like in the
lecture, the command `$ rake` can be used.

To do so we have to install __Rake__ with the ruby internal package manager
`gem`.

1. Install rake with the following command: `$ gem install rake`
2. Install _Bundler_: `$ gem install bundler`

To verify that the installation it was successful run the following command
which will print the rake version:

`rake -V`

The output will look something like this:

`rake, version 12.3.2`

## Run the slide server

Now you can use

`$ rake`

inside the cloned folder where the `Rakefile` is located, to run the _SlideServer_
for the lecture slides.

If everything runs smoothly, the last line of your console message should have
a similar message to this:

`[2019-04-30 00:18:40] INFO WEBrick::HTTPServer#start: pid=596 port=4567`

This means you can access the slides on your browser by visiting:

_note: the port number(4567) in the following command might change depending on
port number displayed in the console's last line above, so make sure to check
this if your browser doesn't load the slides up correctly_:

[http://localhost:4567](http://localhost:4567)

### Run the slide server for other parts

There are two more content folders

- `excercise`
- `practica`

To run and have a look at the slides of these parts you can use:

- `$ rake excercise`
- `$ rake practica`

These commands are starting a similar server on the same port.

# Reading slides without server

You can also directly have a look at the files in the corresponding content
folder.

- `lecture`
- `excercise`
- `practica`

The files in there are either

- [Haml](http://haml.info)
- [Markdown](https://daringfireball.net/projects/markdown/basics)

formatted.

