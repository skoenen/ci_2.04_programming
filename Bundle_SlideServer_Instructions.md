# Guide to View Slides with Bundler

This guide is meant for those who have access to a Linux CLI either on
arch-linux on virtual box, ubuntu cli for windows or dual boot windows/linux
system.

There are two ways now to have a running slide server:

1. Follow the instructions below

## Get the slide contents

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

__Remember the version number (without the 'p...' addition it it has this).__

### Make sure that installed binaries of gems are usable

Change `.profile` in the home folder of your user.

_HINT: I use the **vim** editor, use what you are familiar with_

1. `$ vim $HOME/.profile`
2. Add following line add the end of the file
    ```
    PATH="$HOME/.gem/<RUBY VERSION NUMBER>/bin:$PATH"
    export PATH
    ```
3. Close Terminal or reboot machine
4. Open new terminal and check:
    - `$ echo $PATH`
    - This must include a path similar to: `/home/koenen/.gem/2.6.0/bin`

### Maybe needed: Install development tools

Some _GEMS_ have a native extension (a binary executable) that has to be
compiled, for this reason, specific tools to do the compilation are needed.

- Ubuntu
  - `$ sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev
    libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev
    libcurl4-openssl-dev python-software-properties libffi-dev`

## Install Bundler

_Bundler_ is a package manager that uses the `Gemfile` to know which packages
needs to be installed to run an application.

`$ GEM_HOME=/home/<username>/.gem gem install bundler`

## Install Dependencies of the Slide Server

Go to the folder of the slides repository and run the command:

`$ bundler install --deployment`

## Run the slide server

Now you can use, inside the slide repository

`$ bundler exec rackup -p 4567`

To start a webserver that is serving all contents.
The output should be similar to:

```
[2019-05-07 16:21:24] INFO  WEBrick 1.4.2
[2019-05-07 16:21:24] INFO  ruby 2.6.3 (2019-04-16) [x86_64-linux]
[2019-05-07 16:21:24] INFO  WEBrick::HTTPServer#start: pid=12683 port=4567
```

This means you can access the slides on your browser by visiting:

_note: the port number(4567) in the following command might change depending on
port number displayed in the console's last line above, so make sure to check
this if your browser doesn't load the slides up correctly_:

[http://localhost:4567](http://localhost:4567)

or

`http://<IP ADDRESS>:4567`

You can run the command to:

`$ sudo bundler exec rackup -p 80`

To let the server run on standard HTTP Port. And then use

[http://localhost](http://localhost)

or

`http://<IP ADDRESS>`

## Printing slides.

You are now able to print a pdf out of the slides.
Use _Chrome_ or _Chromium_ and go to:

- For Lecture:
    [http://localhost:4567/lecture?print-pdf](http://localhost:4567/lecture?print-pdf)
- For Lab/Practica:
    [http://localhost:4567/practica?print-pdf](http://localhost:4567/practica?print-pdf)

And after that use the printing function of the browser either to paper or pdf.

# Guide to View Slides

This guide is meant for those who have access to a Linux CLI either on
arch-linux on virtual box, ubuntu cli for windows or dual boot windows/linux
system.

There are two ways now to have a running slide server:

1. Follow the instructions below

## Get the slide contents

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

__Remember the version number (without the 'p...' addition it it has this).__

### Make sure that installed binaries of gems are usable

Change `.profile` in the home folder of your user.

_HINT: I use the **vim** editor, use what you are familiar with_

1. `$ vim $HOME/.profile`
2. Add following line add the end of the file
    ```
    PATH="$HOME/.gem/<RUBY VERSION NUMBER>/bin:$PATH"
    export PATH
    ```
3. Close Terminal or reboot machine
4. Open new terminal and check:
    - `$ echo $PATH`
    - This must include a path similar to: `/home/koenen/.gem/2.6.0/bin`

### Maybe needed: Install development tools

Some _GEMS_ have a native extension (a binary executable) that has to be
compiled, for this reason, specific tools to do the compilation are needed.

- Ubuntu
  - `$ sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev
    libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev
    libcurl4-openssl-dev python-software-properties libffi-dev`

## Install Bundler

_Bundler_ is a package manager that uses the `Gemfile` to know which packages
needs to be installed to run an application.

`$ GEM_HOME=/home/<username>/.gem gem install bundler`

## Install Dependencies of the Slide Server

Go to the folder of the slides repository and run the command:

`$ bundler install --deployment`

## Run the slide server

Now you can use, inside the slide repository

`$ bundler exec rackup -p 4567`

To start a webserver that is serving all contents.
The output should be similar to:

```
[2019-05-07 16:21:24] INFO  WEBrick 1.4.2
[2019-05-07 16:21:24] INFO  ruby 2.6.3 (2019-04-16) [x86_64-linux]
[2019-05-07 16:21:24] INFO  WEBrick::HTTPServer#start: pid=12683 port=4567
```

This means you can access the slides on your browser by visiting:

_note: the port number(4567) in the following command might change depending on
port number displayed in the console's last line above, so make sure to check
this if your browser doesn't load the slides up correctly_:

[http://localhost:4567](http://localhost:4567)

or

`http://<IP ADDRESS>:4567`

You can run the command to:

`$ sudo bundler exec rackup -p 80`

To let the server run on standard HTTP Port. And then use

[http://localhost](http://localhost)

or

`http://<IP ADDRESS>`

## Printing slides.

You are now able to print a pdf out of the slides.
Use _Chrome_ or _Chromium_ and go to:

- For Lecture:
    [http://localhost:4567/lecture?print-pdf](http://localhost:4567/lecture?print-pdf)
- For Lab/Practica:
    [http://localhost:4567/practica?print-pdf](http://localhost:4567/practica?print-pdf)

And after that use the printing function of the browser either to paper or pdf.

