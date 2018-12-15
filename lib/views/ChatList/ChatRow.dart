import 'package:flutter/material.dart';
import '../ChatScreen/ChatScreen.dart';

class ChatRow extends StatelessWidget {
  ChatRow({Key key, this.name, this.avatarUrl}) : super(key: key);
  final String name;
  final String avatarUrl;

  void _openChat(BuildContext context) {
    var route = MaterialPageRoute<void>(
      builder: (context) {
        return ChatScreen(
          name: this.name,
          avatarUrl: this.avatarUrl,
        );
      },
    );
    Navigator.of(context).push(route);
  }

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: CircleAvatar(
        backgroundImage: NetworkImage(this.avatarUrl),
      ),
      title: Text(
        name,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(fontWeight: FontWeight.bold),
      ),
      onTap: () => _openChat(context),
    );
  }
}
