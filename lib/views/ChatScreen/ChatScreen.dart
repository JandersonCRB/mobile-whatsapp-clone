import 'package:flutter/material.dart';

class ChatScreen extends StatelessWidget {
  ChatScreen({Key key, this.name, this.avatarUrl}) : super(key: key);
  final name;
  final avatarUrl;

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