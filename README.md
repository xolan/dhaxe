# dhaxe

"dhaxe" is a simple project meant to speed up Haxe development on any environment.
It only requires Docker to be installed, as well as Python 3+.

Currently it installs Haxe, OpenFL, Flixel, Flixel-tools and their dependencies.
Java and C# target support is also provided.

## Usage

Before using the dhaxe utility script, install the required Python packages using pip; `pip install -r requirements.txt`

```rst
dhaxe

Usage:
    dhaxe stop
    dhaxe rm
    dhaxe rmi
    dhaxe clean
    dhaxe build --author=<name>
    dhaxe run
    dhaxe do <command>...
    dhaxe (-h | --help)
    dhaxe generate-readme

Options:
    stop                 Stops all running containers
    rm                   Remove all containers
    rmi                  Remove all images
    clean                Stops and removes all containers and images
                         Same as "stop", "rm", "rmi" in sequence
    build                Builds the docker image
        --author=<name>      This variable will be used for templates created
    run                  Run haxe
                         Same as "do haxe"
    do <command>...      Execute <command> on the container
    (-h | --help)        Show help
    generate-readme      Generate README.md

```

