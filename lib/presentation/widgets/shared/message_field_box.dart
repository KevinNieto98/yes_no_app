import 'package:flutter/material.dart';

class MessageFieldBox extends StatelessWidget {
  final ValueChanged<String> onValue;


  
  const MessageFieldBox({
    super.key,
    required this.onValue
  });

  @override
  Widget build(BuildContext context) {
    //final colors = Theme.of(context).colorScheme;
    final textController = TextEditingController();
    final FocusNode focusNode = FocusNode();

    final outlineInputBorder = UnderlineInputBorder(
        borderSide: const BorderSide(color: Colors.transparent),
        borderRadius: BorderRadius.circular(40));

    final inputDecoration = InputDecoration(
      hintText: 'End your message with a "?"',
      border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(20), borderSide: BorderSide.none),
      filled: true,
      suffixIcon: IconButton(
        icon: const Icon(Icons.send_outlined),
        onPressed: () {
          final textValue = textController.value.text;
          textController.clear();
          onValue(textValue);
        },
      ),
      enabledBorder: outlineInputBorder,
      focusedBorder: outlineInputBorder,
    );

    return TextFormField(
      onTapOutside: (event) {
        focusNode.unfocus();
      },
      focusNode: focusNode,
      controller: textController,
      decoration: inputDecoration,
      onFieldSubmitted: (value) {
        //print('submit value $value');
        onValue(value);
        textController.clear();
        focusNode.requestFocus();
      },
    );
  }
}
