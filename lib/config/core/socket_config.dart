
import 'package:socket_io_client/socket_io_client.dart';
import 'package:testt/config/clients/socket_client.dart';

class SocketConfig{
final  _socketclient=SocketClient.instance.socket!;

Socket get socket=>_socketclient;
void joinRoom(String docId){
  _socketclient.emit("join",docId);
}
void getContentTyping( Map<dynamic,String> data){
  _socketclient.emit("writing",data);
}

void listener(Function func){
  _socketclient.on("changes", (data) => func(data));
}

}