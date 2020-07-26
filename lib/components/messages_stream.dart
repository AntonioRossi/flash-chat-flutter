import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/components/message_bubble.dart';
import 'package:flash_chat/constants.dart';
import 'package:flutter/material.dart';

class MessagesStream extends StatelessWidget {
  const MessagesStream(
      {@required Firestore firestore, @required this.currentUser})
      : _firestore = firestore;

  final Firestore _firestore;
  final FirebaseUser currentUser;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection(kMessagesCollection).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(
              backgroundColor: Colors.lightBlueAccent,
            ),
          );
        } else {
          final List<DocumentSnapshot> messages = snapshot.data.documents;
          List<MessageBubble> messageBubbles = [];
          for (DocumentSnapshot message in messages) {
            final messageText = message.data[kMessageText];
            final sender = message.data[kMessageSender];
            final item = MessageBubble(
              text: messageText,
              sender: sender,
              isMe: currentUser.email == sender,
            );
            messageBubbles.add(item);
          }
          return Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(vertical: 10, horizontal: 10),
              children: messageBubbles,
            ),
          );
        }
      },
    );
  }
}
