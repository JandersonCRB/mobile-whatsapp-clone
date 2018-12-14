import 'package:flutter/material.dart';

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
    var route = MaterialPageRoute<void>(builder: (context) => new ChatScreen());
    Navigator.of(context).push(route);
  }

  AppBar _buildAppBar() {
    return AppBar(
      titleSpacing: -5,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(right: 10),
            child: CircleAvatar(
              backgroundImage: NetworkImage(this.avatarUrl),
            ),
          ),
          Text(this.name),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: _buildAppBar(),
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
              image: AssetImage('assets/wallpaper.png'),
              fit: BoxFit.cover,
            )),
          ),
          Column(
            children: <Widget>[
              Expanded(
                child: ListView(
                  children: <Widget>[
                    Text("msg1"),
                    Text("msg2"),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 8, bottom: 8, left: 5, right: 5),
                child: Row(
                  children: <Widget>[
                    Expanded(
                      child: Container(
                        margin: EdgeInsets.only(right: 5),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.all(
                            Radius.circular(50.0),
                          ),
                        ),
                        child: Row(
                          children: <Widget>[
                            Container(
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.only(left: 1, right: 2),
                              child: FlatButton(
                                padding: EdgeInsets.all(0),
                                shape: CircleBorder(side: BorderSide.none),
                                child: Icon(Icons.sentiment_very_satisfied),
                                onPressed: () {},
                              ),
                            ),
                            Expanded(
                              child: TextField(
                                decoration: InputDecoration(
                                  border: InputBorder.none,
                                  hintText: "Digite aqui...",
                                ),
                              ),
                            ),
                            Container(
                              width: 50,
                              height: 50,
                              margin: EdgeInsets.only(left: 2, right: 1),
                              child: FlatButton(
                                padding: EdgeInsets.all(0),
                                shape: CircleBorder(side: BorderSide.none),
                                child: Icon(Icons.attach_file),
                                onPressed: () {},
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    FloatingActionButton(
                      onPressed: () => print("send"),
                      backgroundColor: Theme.of(context).primaryColor,
                      child: Padding(
                        padding: const EdgeInsets.only(left: 5),
                        child: Icon(
                          Icons.send,
                          size: 27,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class ChatRow extends StatelessWidget {
  ChatRow({Key key, this.name, this.avatarUrl}) : super(key: key);
  final String name;
  final String avatarUrl;

  void _openChat(BuildContext context) {
    var route = new MaterialPageRoute<void>(
        builder: (context) => ChatScreen(
              name: this.name,
              avatarUrl: this.avatarUrl,
            ));
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
        onPressed: () => print("click"),
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
