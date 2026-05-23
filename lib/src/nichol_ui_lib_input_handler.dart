import 'package:flutter/material.dart';
import 'package:nichol_ui_lib_toast/nichol_ui_lib_toast.dart';

// Requires Material Parent (Scaffold)
class NicholUILibInputHandler extends StatefulWidget {
  final void Function(String)? onSend;
  final void Function(String, BuildContext)? onSendWithToast;

  NicholUILibInputHandler({Key? key, this.onSend, this.onSendWithToast}) : super(key: key);

  @override
  _NicholUILibInputHandlerState createState() => _NicholUILibInputHandlerState();
}

class _NicholUILibInputHandlerState extends State<NicholUILibInputHandler> {
  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(8.0),
        child: Row(
          children: [
            Expanded(
              child: TextField(
                autofocus: true,
                controller: _controller,
                maxLines: null,
                decoration: InputDecoration(
                  hintText: 'Enter your message...',
                  border: OutlineInputBorder(),
                ),
                onSubmitted: (value) {
                  // Prevent "Return" from sending directly
                  _sendMessage();
                },
              ),
            ),
            IconButton(
              icon: Icon(Icons.send),
              onPressed: () {
                _sendMessage();
              },
            ),
          ],
        ));
  }

  void _sendMessage() {
    final message = _controller.text.trim();
    if (message.isNotEmpty) {
      if (widget.onSend != null) {
        widget.onSend!(message);
      }
      else if (widget.onSendWithToast != null) {
        widget.onSendWithToast!(message, context);
      }
      else {
        NicholUILibToast.show(
          msg: "YOU DIDNT SET UP A HANDLER FOR THIS FUNCTION!!! $message",
          context: context,
          toastLength: ToastLength.short,
          gravity: ToastGravity.bottom,
          backgroundColor: Colors.red,
          textColor: Colors.black,
          fontSize: 16.0,
        );
      }

    }
    else {
      NicholUILibToast.show(
          msg: "No message caught before triggering handler",
          context: context,
          toastLength: ToastLength.short,
          gravity: ToastGravity.bottom,
          backgroundColor: Colors.red,
          textColor: Colors.black,
          fontSize: 16.0,
        );
    }
      _controller.clear();
    }
  }
