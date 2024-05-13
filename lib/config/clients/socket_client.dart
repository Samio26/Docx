import 'package:socket_io_client/socket_io_client.dart' as IO;

class SocketClient{
  IO.Socket? socket;
  static SocketClient? _instance;

  SocketClient._interanl(){
   socket= IO.io("",<String,dynamic>{
    "transports":["websockets"],
    "autoconnect":false
   });
   socket!.connect();
  }

  static SocketClient get instance{
    _instance=SocketClient._interanl();
    return _instance!;
  }
  
}