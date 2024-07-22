import 'package:flutter/material.dart';
import 'package:yes_no_ap/config/helpers/get_yes_no_answer.dart';
import 'package:yes_no_ap/domain/entities/message.dart';

// *Notifica de mensajes
class ChatProvider extends ChangeNotifier {
  final ScrollController chatScrollController = ScrollController();
  final GetYesNoAnswer getYesNoAnswer = GetYesNoAnswer();

  List<Message> messagesList = [
    Message(text: 'Hola mundo', fromWho: FromWho.me),
    Message(text: 'Hola mundo', fromWho: FromWho.me),
    Message(text: 'Hola mundo', fromWho: FromWho.me),
    Message(text: 'Hola mundo', fromWho: FromWho.me),
    Message(text: 'Esta es una pregunta?', fromWho: FromWho.me),
  ];

  Future<void> sendMessage(String text) async {
    if (text.isEmpty) return;

    final newMessage = Message(text: text, fromWho: FromWho.me);
    messagesList.add(newMessage);

    if (text.contains('?')) {
      await herReply();
    }
    notifyListeners();
    moveScrollToBottom();
  }

  Future<void> herReply() async {
    final herMessage = await getYesNoAnswer.getAnswer();
    print(herMessage);
    messagesList.add(herMessage);
    notifyListeners();
  }

  void moveScrollToBottom() async {
    await Future.delayed(const Duration(milliseconds: 100));
    chatScrollController.animateTo(
      chatScrollController.position.maxScrollExtent,
      duration: const Duration(milliseconds: 300),
      curve: Curves.easeOut,
      //offset
    );
  }
}
