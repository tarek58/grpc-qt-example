# grpc-qt-example
This is a fork of [C0D1UM/grpc-qt-example](https://github.com/C0D1UM/grpc-qt-example) updated to focus on the `linux-g++` environment and a more modern version of gRPC (tested with 1.46.3).

The vcpkg libraries from the original upstream were removed.  The build chain in this version assumes that gRPC was installed in `/opt/grpc-install`. 

## Generating gRPC and pb stub files
The `.pb` and `.grpc` files are not committed to source control and thus aren't distributed as part of this repo.  If you were to try to build the `rpc_client.pro` or `rpc_server.pro` files immediately after cloning this repo you will get build errors since you'd be missing the following files at minimum:

* helloworld.grpc.pb.cc
* helloworld.grpc.pb.h
* helloworld.pb.cc
* helloworld.pb.h

These get generated using the `protoc` command line tool included in the `bin` folder of your gRPC install.  Sample usage:

```
cd /path/to/grpc-qt-example
cd rpc_client_cpp
/opt/grpc-install/bin/protoc --proto_path=../ helloworld.proto --cpp_out=.
/opt/grpc-install/bin/protoc --proto_path=../ helloworld.proto --grpc_out=. --plugin=protoc-gen-grpc=/opt/grpc-install/bin/grpc_cpp_plugin 
```

Repeat the last two commands in the `rpc_server` directory as well.

## Sample build
In order to get the project to build on `linux-g++` using gRPC 1.46.3, I had to add many additional library declartions to the `LIBS += ...` directive of `rpc_client.pro` and `rpc_server.pro`.  You can see those in the respective files.  You may need to edit this for your specific system and version combinations.

```
mkdir -p /tmp/rpc_client
cd /tmp/rpc_client
qmake -r -spec linux-g++ CONFIG+=release /path/to/grpc-qt-example/rpc_client.pro
make

mkdir -p /tmp/rpc_server
cd /tmp/rpc_server 
qmake -r -spec linux-g++ CONFIG+=release /path/to/grpc-qt-example/rpc_server.pro
make
```

You can now run `/tmp/rpc_client/rpc_client` and `/tmp/rpc_server/rpc_server`.