import 'package:flutter/material.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class ChatScreen extends StatefulWidget {
  ChatScreen({Key key, this.name, this.avatarUrl, this.uid}) : super(key: key);
  final name;
  final avatarUrl;
  final uid;
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final myController = TextEditingController();
  var uid = "";
  @override
  void initState() {
    super.initState();
    FirebaseAuth.instance.currentUser().then((user) {
      setState(() => uid = user.uid);
    });
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is disposed
    myController.dispose();
    super.dispose();
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
              backgroundImage: NetworkImage(widget.avatarUrl),
            ),
          ),
          Text(widget.name),
        ],
      ),
    );
  }

  _sendMsg() async {
    var message = myController.text.toString();
    Firestore.instance
        .collection('messages')
        .add({'from': uid, 'to': widget.uid, 'message': message});
    myController.clear();
  }

  _bodyBuild() {
    return StreamBuilder<QuerySnapshot>(
      stream: Firestore.instance.collection('messages').snapshots(),
      builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
        if (snapshot.hasError) return Text('Error: ${snapshot.error}');
        switch (snapshot.connectionState) {
          case ConnectionState.waiting:
            return Center(child: CircularProgressIndicator());
          default:
            return new ListView(
              children: snapshot.data.documents
                  .where((document) =>
                      document['from'] == uid ||
                      document['from'] == widget.uid && document['to'] == uid ||
                      document['to'] == widget.uid)
                  .map((DocumentSnapshot document) {
                return Text(document['message']);
              }).toList(),
            );
        }
      },
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
                child: _bodyBuild(),
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
                                controller: myController,
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
                      onPressed: _sendMsg,
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
