import 'dart:io';

import 'package:flutter/material.dart';
import 'package:simplechatappliction/customUI/background.dart';
import 'package:simplechatappliction/customUI/caht_list_item.dart';
import 'package:simplechatappliction/customUI/input.dart';
import 'package:simplechatappliction/model/chat_model.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.userName});

  final String userName;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late IO.Socket socket;
  List<ChatModel> messages = [];
  ScrollController scrollController = ScrollController();

  @override
  void initState() {
    socket = IO.io(
        Platform.isAndroid ? 'http://10.0.2.2:8000' : 'http://localhost:8000',
        IO.OptionBuilder().setTransports(['websocket']).setQuery({
          "userName": widget.userName,
        }).build());
    _connect();
    super.initState();
  }

  _connect() {
    socket.onConnect((_) {
      socket.on('message', (msg) {
        final message = chatModelFromJson(msg);
        setState(() {
          messages.add(message);
        });
      });
    });
    socket.onConnectError((data) => debugPrint('Error >>$data'));
    socket.onDisconnect((_) => debugPrint('disconnect'));
  }

  void scrollToBottom() {
    if (!scrollController.hasClients) {
      final position = scrollController.position.maxScrollExtent;
      scrollController.animateTo(
        position,
        duration: const Duration(milliseconds: 300),
        curve: Curves.easeOut,
      );
    }
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Background(
          child: Column(
            children: [
              Expanded(
                child: ListView.separated(
                  shrinkWrap: true,
                  padding: MediaQuery.viewInsetsOf(context),
                  reverse: scrollController.hasClients ? true : false,
                  controller: scrollController,
                  separatorBuilder: (context, index) {
                    return const SizedBox(height: 6);
                  },
                  itemCount: messages.length,
                  itemBuilder: (context, index) {
                    final data = scrollController.hasClients
                        ? messages.reversed.toList()
                        : messages.toList();
                    return ChatItem(
                      messages: data,
                      index: index,
                      userName: widget.userName,
                    );
                  },
                ),
              ),
              Input(onSend: (value) {
                scrollToBottom();
                socket.emit('message', value);
              }),
            ],
          ),
        ),
      ),
    );
  }
}
