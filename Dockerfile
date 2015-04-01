FROM imsky/haxe:latest
MAINTAINER Jonas Svarvaa <jonassvarvaa@gmail.com>

RUN apt-get update

# Install C# support
RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF ; \
    echo "deb http://download.mono-project.com/repo/debian wheezy main" > /etc/apt/sources.list.d/mono-xamarin.list

# Install OS-level dependencies
# Install Java support
RUN apt-get update ; \
    apt-get -y install default-jdk mono-devel

RUN haxelib install hxjava ; \
    haxelib install hxcs

# Install OpenFL
RUN haxelib install openfl ; \
    yes|haxelib run openfl setup ; \
    yes|lime setup

# Install Flixel
RUN haxelib install flixel ; \
    haxelib install flixel-tools

# Install Nape, Systools, Spinehx, Firetongue
RUN haxelib install nape ; \
    haxelib install systools ; \
    haxelib install spinehx ; \
    haxelib install firetongue

ADD source_me.sh ./
RUN chmod +x source_me.sh ; \
    . ./source_me.sh ; \
    echo $DHAXE_AUTHOR ; \
    echo "y\ny\n$DHAXE_AUTHOR\n0\ny" | haxelib run flixel-tools setup
