import 'package:flutter/material.dart';
import 'package:simplechatappliction/model/chat_model.dart';

class ChatItem extends StatelessWidget {
  const ChatItem({
    super.key,
    required this.messages,
    required this.index,
    required this.userName,
  });
  final List<ChatModel> messages;
  final int index;
  final String userName;

  @override
  Widget build(BuildContext context) {
    final item = messages[index];
    final isMyMessage = userName != item.sender;

    final color = isMyMessage
        ? const Color.fromARGB(255, 249, 220, 255)
        : const Color(0xffD0F5BE);

    return Padding(
      key: UniqueKey(),
      padding: const EdgeInsets.all(8.0),
      child: Directionality(
        textDirection: isMyMessage ? TextDirection.ltr : TextDirection.rtl,
        child: Align(
          alignment: isMyMessage ? Alignment.centerLeft : Alignment.centerRight,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CircleAvatar(
                  maxRadius: 26,
                  // backgroundColor: Colors.red,
                  // backgroundImage: const AssetImage('assets/background.jpg'),
                  backgroundColor: color,
                  child: Center(
                      child: FittedBox(
                          child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      item.sender.toUpperCase(),
                      style: const TextStyle(fontWeight: FontWeight.bold),
                    ),
                  )))),
              const SizedBox(height: 6),
              Expanded(
                child: Align(
                  alignment: isMyMessage
                      ? Alignment.centerLeft
                      : Alignment.centerRight,
                  child: Container(
                    constraints: const BoxConstraints(
                        minWidth: 50, maxWidth: double.infinity),
                    margin: const EdgeInsets.only(top: 20, left: 4, right: 4),
                    decoration: BoxDecoration(
                        color: color, borderRadius: BorderRadius.circular(12)),
                    padding: const EdgeInsets.all(8),
                    child: Text(
                      item.message,
                      textAlign: TextAlign.left,
                      textDirection: TextDirection.ltr,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
