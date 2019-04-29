# Guide to View Slides

This guide is meant for those who have access to a Linux CLI either on arch-linux on virtual box, ubuntu cli for windows or dual boot windows/linux system.

Also this guide assumes you must have a [clone](https://help.github.com/en/articles/cloning-a-repository) or download of the project on your pc.

## Install Ruby

Firstly you need to install from the cli using the following commands:
`sudo apt update`
`sudo apt install ruby-full`

To verify that the installation it was successful run the following command which will print the Ruby version:
`ruby --version`

The output will look something like this:
`ruby 2.5.1p57 (2018-03-29 revision 63029) [x86_64-linux-gnu]`

Finally, for some reason ruby development tools doesn't seem to come with the full installation done above so we have to manually install all of them with the following command:

`sudo apt-get install git-core curl zlib1g-dev build-essential libssl-dev libreadline-dev libyaml-dev libsqlite3-dev sqlite3 libxml2-dev libxslt1-dev libcurl4-openssl-dev python-software-properties libffi-dev`

## Install Rake

You would now need to build the project to view the slides based on the Rakefile in the project folder.

Firstly install rake as follows:
`gem install rake`

To verify that the installation it was successful run the following command which will print the rake version:
`rake -V`

The output will look something like this:
`rake, version 12.3.2`

Then run the `rake` command which runs the default serve command in the Rakefile [Note: This command should be run from the project directory].
`rake`

If everything runs smoothly, the last line of your console message should have a similar message to this:
`[2019-04-30 00:18:40] INFO WEBrick::HTTPServer#start: pid=596 port=4567`

This means you can access the slides on your browser by visiting: [Note: The port number(4567) in the following command might change depending on port number displayed in the console's last line above, so make sure to check this if your browser doesn't load the slides up correctly]:
`http://localhost:4567`
