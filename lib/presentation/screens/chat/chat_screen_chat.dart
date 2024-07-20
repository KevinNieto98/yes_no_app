import 'package:flutter/material.dart';
import 'package:yes_no_ap/presentation/widgets/chat/her_message_bubble.dart';
import 'package:yes_no_ap/presentation/widgets/chat/my_message_bubble.dart';
import 'package:yes_no_ap/presentation/widgets/shared/message_field_box.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: const Padding(
            padding: EdgeInsets.all(4.0),
            child: CircleAvatar(
                backgroundImage: NetworkImage(
                    'https://d1rig8ldkblbsy.cloudfront.net/app/uploads/2021/06/24115325/jennifer-aniston-crop-1624532037-1172x1172.jpg')),
          ),
          title: const Text('Mi amor'),
        ),
        body: _ChatWiew());
  }
}

class _ChatWiew extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: Column(
          children: [
            Expanded(
                child: ListView.builder(
                  itemCount: 10,
                  itemBuilder: (context, index) {
                      return  (index % 2==0)
                      ? const HerMessageBubble() 
                      : const MyMessageBubble();
              },
            )),
           const MessageFieldBox()
          ],
        ),
      ),
    );
  }
}
