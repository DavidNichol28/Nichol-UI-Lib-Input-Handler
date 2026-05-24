# nichol_ui_lib_input_handler
![pub package](https://img.shields.io/pub/v/nichol_ui_lib_input_handler.svg)

A lightweight Flutter input handler widget designed for chat-style UIs.
Provides a ready-made text input field with send handling, optional toast feedback, and flexible callback support.

Built to work seamlessly with `nichol_ui_lib_toast`.

---

## Features

* Drop-in chat input widget
* Built-in send button + submit handling
* Supports plain send callback or toast-enabled callback
* Automatic input clearing after send
* Error handling with fallback toast notifications
* Works with any Material Scaffold layout
* Zero external dependencies except optional toast package

---

## Installation

Add the package to your `pubspec.yaml`:

```yaml
dependencies:
  nichol_ui_lib_input_handler: ^0.0.1
```

Then run:

```bash
flutter pub get
```

---

## Usage

### Basic Usage (Simple Send Callback)

```dart
NicholUILibInputHandler(
  onSend: (message) {
    print("User sent: $message");
  },
)
```

---

### Advanced Usage (With Toast Context)

```dart
NicholUILibInputHandler(
  onSendWithToast: (message, context) {
    NicholUILibToast.show(
      context: context,
      msg: "Sent: $message",
    );
  },
)
```

---

## Behavior

The widget follows this priority order:

1. If `onSend` is provided → it is called
2. Else if `onSendWithToast` is provided → it is called
3. Else → a toast error is shown

---

## Error Handling

If no handler is provided:

* A red toast is displayed warning the developer
* Message is still captured and cleared safely

If message is empty:

* A toast warning is shown
* No callback is triggered

---

## UI Overview

The widget renders:

* A full-width `TextField`
* A send `IconButton`
* Auto-expanding multiline input
* Submit via:

  * Enter key
  * Send button

---

## Example

```dart
Scaffold(
  body: Column(
    children: [
      Expanded(child: Container()),
      NicholUILibInputHandler(
        onSend: (msg) {
          print(msg);
        },
      ),
    ],
  ),
)
```

---

## Dependencies

This package works best with:

* nichol_ui_lib_toast (optional, for feedback UI)

---

## Notes

* Must be used inside a Material app context (Scaffold required)
* Designed for chat applications and messaging interfaces
* Clears input automatically after send

---

## License

Personal / experimental project.
