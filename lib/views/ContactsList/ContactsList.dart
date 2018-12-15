import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../ChatScreen/ChatScreen.dart';

class ContactsList extends StatelessWidget {
  _openChat(BuildContext context, String displayName, photoURL, uid) {
    var route = MaterialPageRoute<void>(
      builder: (context) {
        return ChatScreen(
          name: displayName,
          avatarUrl: photoURL,
          uid: uid
        );
      },
    );
    Navigator.of(context).push(route);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Contatos"),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: Firestore.instance.collection('users').snapshots(),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.hasError) return Text('Error: ${snapshot.error}');
          switch (snapshot.connectionState) {
            case ConnectionState.waiting:
              return Center(
                child: CircularProgressIndicator(),
              );
            default:
              return ListView(
                children: snapshot.data.documents.map(
                  (DocumentSnapshot document) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(document['photoURL']),
                      ),
                      title: Text(
                        document['displayName'],
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                      onTap: () => _openChat(context, document['displayName'],
                          document['photoURL'], document['uid']),
                    );
                  },
                ).toList(),
              );
          }
        },
      ),
    );
  }
}
