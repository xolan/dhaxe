FROM imsky/haxe:latest
MAINTAINER Jonas Svarvaa <jonassvarvaa@gmail.com>

RUN apt-get update

# Install Java support
RUN apt-get -y install default-jdk
RUN haxelib install hxjava

# Install C# support
RUN apt-key adv --keyserver pgp.mit.edu --recv-keys 3FA7E0328081BFF6A14DA29AA6A19B38D3D831EF
RUN echo "deb http://download.mono-project.com/repo/debian wheezy main" > /etc/apt/sources.list.d/mono-xamarin.list
RUN apt-get -y install mono-devel
RUN haxelib install hxcs

# Install OpenFL
RUN haxelib install openfl
RUN yes|haxelib run openfl setup

# Install Flixel
RUN haxelib install flixel
RUN haxelib install flixel-tools

# Install Nape, Systools, Spinehx
RUN haxelib install nape ; \
    haxelib install systools ; \
    haxelib install spinehx ; \

ADD source_me.sh ./
RUN chmod +x source_me.sh ; \
    . ./source_me.sh ; \
    echo $DHAXE_AUTHOR ; \
    echo "y\ny\n$DHAXE_AUTHOR\n0\ny" | haxelib run flixel-tools setup
