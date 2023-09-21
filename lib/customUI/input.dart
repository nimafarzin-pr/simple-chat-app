import 'package:flutter/material.dart';

typedef DataCallBack = Function(String data)?;

class Input extends StatefulWidget {
  const Input({super.key, required this.onSend});

  final DataCallBack onSend;

  @override
  State<Input> createState() => _InputState();
}

class _InputState extends State<Input> {
  TextEditingController controller = TextEditingController();

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return TextField(
      maxLines: 3,
      minLines: 1,
      // onTap: () => scrollToBottom(),
      controller: controller,
      decoration: InputDecoration(
        fillColor: Colors.white.withOpacity(0.8),
        filled: true,
        hintText: 'Type something...',
        suffixIcon: IconButton(
          onPressed: () {
            if (controller.text.isNotEmpty && widget.onSend != null) {
              widget.onSend!(controller.text);
              controller.clear();
            }
          },
          icon: const Icon(Icons.send),
        ),
      ),
    );
  }
}
