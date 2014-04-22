gitlist-docker
==============

A ready to use docker image with preinstalled nginx and gitlist.

You can use it to quickly expose a web interface of the git repositories in a
directory of your host machine.

The dockerfile uses the lastest gitlist-master.tar.gz distribution
available.

Usage
-----

You can build the image like this

    git clone <this repo>
    cd gitlist-docker
    docker build --rm=true -t gitlist .

And run it like this

    docker run --rm=true -p 8888:80 -v /path/repo:/repos gitlist

The web interface will be available on host machine at port 80 and will show
repositories inside /path/repo
