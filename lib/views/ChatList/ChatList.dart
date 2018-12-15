import 'package:flutter/material.dart';

import 'ChatRow.dart';
import '../ContactsList/ContactsList.dart';

class ChatListState extends State<ChatList> {
  _rowBuilder() {
    return <ChatRow>[
      ChatRow(
        name: "Janderson Angelo",
        avatarUrl:
            "https://scontent.fmcz2-1.fna.fbcdn.net/v/t1.0-9/24174209_1454411614675537_5507148558114174002_n.jpg?_nc_cat=109&_nc_ht=scontent.fmcz2-1.fna&oh=99ba494f4141a28ece836477adbd7ee9&oe=5CAE3A32",
      ),
      ChatRow(
        name: "Flávitxo",
        avatarUrl: "https://puu.sh/CgeH3/59712271f3.png",
      ),
      ChatRow(
        name: "Flávitxo",
        avatarUrl: "https://puu.sh/CgeH3/59712271f3.png",
      ),
    ];
  }

  _openContacts() {
    var route = MaterialPageRoute<void>(
      builder: (context) {
        return ContactsList();
      },
    );
    Navigator.of(context).push(route);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text('Whatsapp'),
      ),
      body: new ListView(
        padding: const EdgeInsets.only(top: 10.0),
        children: _rowBuilder(),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _openContacts,
        backgroundColor: Theme.of(context).primaryColor,
        child: Icon(Icons.message),
      ),
    );
  }
}

class ChatList extends StatefulWidget {
  @override
  ChatListState createState() => new ChatListState();
}
