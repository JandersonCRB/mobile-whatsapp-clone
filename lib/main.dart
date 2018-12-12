import 'package:flutter/material.dart';
import 'package:english_words/english_words.dart';

void main() {
  runApp(new MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Whatsapp Clone',
      theme: new ThemeData(
        primaryColor: Colors.teal[900],
      ),
      home: new ChatList(),
    );
  }
}

class ChatScreen extends StatelessWidget {
  ChatScreen({Key key, this.name, this.avatarUrl}) : super(key: key);
  final name;
  final avatarUrl;

  void _openChat(BuildContext context) {
    var route =
        new MaterialPageRoute<void>(builder: (context) => new ChatScreen());
    Navigator.of(context).push(route);
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: Row(
          children: <Widget>[
            new CircleAvatar(backgroundImage: new NetworkImage(this.avatarUrl)),
            new Text(this.name)
          ]
        )
      )
    );
  }
}

class ChatRow extends StatelessWidget {
  ChatRow({Key key, this.name, this.avatarUrl}) : super(key: key);
  final String name;
  final String avatarUrl;

  void _openChat(BuildContext context) {
    var route = new MaterialPageRoute<void>(
        builder: (context) =>
            new ChatScreen(name: this.name, avatarUrl: this.avatarUrl));
    Navigator.of(context).push(route);
  }

  @override
  Widget build(BuildContext context) {
    return new ListTile(
        leading: CircleAvatar(
          backgroundImage: NetworkImage(this.avatarUrl),
        ),
        title: new Text(name,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(fontWeight: FontWeight.bold)),
        onTap: () => _openChat(context));
  }
}

class ChatListState extends State<ChatList> {
  _rowBuilder() {
    return <ChatRow>[
      new ChatRow(
          name: "Janderson Angelo",
          avatarUrl:"https://scontent.fmcz2-1.fna.fbcdn.net/v/t1.0-9/24174209_1454411614675537_5507148558114174002_n.jpg?_nc_cat=109&_nc_ht=scontent.fmcz2-1.fna&oh=99ba494f4141a28ece836477adbd7ee9&oe=5CAE3A32"),
      new ChatRow(
          name: "Flávitxo", avatarUrl: "https://puu.sh/CgeH3/59712271f3.png"),
      new ChatRow(
          name: "Flávitxo", avatarUrl: "https://puu.sh/CgeH3/59712271f3.png"),
    ];
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
    );
  }
}

class ChatList extends StatefulWidget {
  @override
  ChatListState createState() => new ChatListState();
}