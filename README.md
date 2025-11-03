# swipe_magic [![pub package](https://img.shields.io/pub/v/swipe_magic.svg)](https://pub.dartlang.org/packages/swipe_magic)

A Flutter package for Tinder-like swipe cards with smooth animations and customizable interactions. This package provides an intuitive and smooth swipe experience with support for three different swipe directions:
- Right swipe for like ❤️
- Left swipe for nope ❌
- Up swipe for superlike ⭐

## ✨ Features

- 🎨 Smooth animations with elastic bounce-back
- 📱 Supports left, right, and up swipe gestures
- 🎯 Customizable swipe sensitivity and regions
- 🔧 Programmatic swipe control
- 📚 Easy-to-use API with comprehensive callbacks
- 🎭 Customizable swipe tags and visual feedback
- 🚀 High performance with optimized rendering

## 📦 Installation

Add this to your package's `pubspec.yaml` file:

```yaml
dependencies:
  swipe_magic: ^1.0.0
```

Then run:

```bash
flutter pub get
```

## 🚀 Usage

### Basic Example

```dart
import 'package:swipe_magic/swipe_magic.dart';

SwipeCards(
            matchEngine: <MatchEngine>,
            itemBuilder: (BuildContext context, int index) {},
            onStackFinished: () {},
            itemChanged: (SwipeItem item, int index) {},
            upSwipeAllowed: <bool>,
            fillSpace: <bool>,
);
```

### 🎯 SwipeCards Widget Attributes

| Key                | Description                                                    |
|---------------------|-------------------------------------------------------------------|
| `matchEngine`       |  An instance of `MatchEngine` that acts as controller for triggering swipes manually.    |
| `itemBuilder`       |  A function that returns the view inside a swipe card.                    |
| `likeTag`           |  Widget appears in like/right area during swipe.                    |
| `nopeTag`           |  Widget appears in nope/left area during swipe.                    |
| `superLikeTag`      |  Widget appears in super-like/up area during swipe.                    |
| `onStackFinished`   |  A function that is triggered as soon as all the cards have been swiped.    |
| `itemChanged`       |  A function that is triggered when item in the stack changes (moves to next card).    |
| `leftSwipeAllowed`  |  To enable/disable left swipe. (Default: true)    |
| `rightSwipeAllowed` |  To enable/disable right swipe. (Default: true)    |
| `upSwipeAllowed`    |  To enable/disable up swipe. (Default: false)    |
| `fillSpace`         |  Config whether to fill up the space or not. (Default: true)    |

### 🎮 MatchEngine Controller

`MatchEngine` is the controller for the swipe cards. It takes `swipeItems` as an argument and is
used to trigger the swipes manually, for example on button press. The data type of `swipeItems`
is `List<SwipeItem>`.

```dart
MatchEngine _matchEngine = MatchEngine(swipeItems: List<SwipeItem>);
```

### 🔧 MatchEngine Functions

| Key                | Description                                                    |
|-------------------|-------------------------------------------------------------------|
| `_matchEngine.currentItem.like();`    | To trigger right swipe manually.    |
| `_matchEngine.currentItem.nope();`     |  To trigger left swipe manually.                    |
| `_matchEngine.currentItem.superLike();` |  To trigger up swipe manually.    |

### 📋 SwipeItem

`SwipeItem` contains the actual data that can be rendered in the swipe card. It is a
wrapper over any dynamic object and adds the functionality of like, nope and superlike to that
object.

```dart
SwipeItem(
            content: "Anup Kumar Panwar",
            likeAction: () {
                log("Like");
            },
            nopeAction: () {
                log("Nope");
            },
            superlikeAction: () {
                log("Superlike");
            },
            onSlideUpdate: (SlideRegion? region){
                log("Region $region");
            }
);
```

### 🎯 SwipeItem Attributes

| Key                | Description                                                    |
|-------------------|-------------------------------------------------------------------|
| `content`    | An object that contains the actual data to be rendered in the swipe card.    |
| `likeAction`     |  A function that is triggered when the card is liked.                    |
| `nopeAction` |  A function that is triggered when the card is not liked / swiped left.    |
| `superlikeAction` |  A function that is triggered when the card is superliked.    |
| `onSlideUpdate` |  A function that is triggered when the card is being dragged and tells about the current region of the card.    |

### 📱 Complete Example

```dart
import 'package:flutter/material.dart';
import 'package:swipe_magic/swipe_magic.dart';
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Swipe Magic Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Swipe Magic Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key? key, this.title}) : super(key: key);
  final String? title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<SwipeItem> _swipeItems = <SwipeItem>[];
  MatchEngine? _matchEngine;
  List<String> _names = ["Red", "Blue", "Green", "Yellow", "Orange"];
  List<Color> _colors = [
    Colors.red,
    Colors.blue,
    Colors.green,
    Colors.yellow,
    Colors.orange
  ];

  @override
  void initState() {
    for (int i = 0; i < _names.length; i++) {
      _swipeItems.add(SwipeItem(
          content: Content(text: _names[i], color: _colors[i]),
          likeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Liked ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          nopeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Nope ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          superlikeAction: () {
            ScaffoldMessenger.of(context).showSnackBar(SnackBar(
              content: Text("Superliked ${_names[i]}"),
              duration: Duration(milliseconds: 500),
            ));
          },
          onSlideUpdate: (SlideRegion? region) async {
            print("Region $region");
          }));
    }

    _matchEngine = MatchEngine(swipeItems: _swipeItems);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title!),
        ),
        body: Container(
            child: Column(children: [
          Container(
            height: 550,
            child: SwipeCards(
              matchEngine: _matchEngine!,
              itemBuilder: (BuildContext context, int index) {
                return Container(
                  alignment: Alignment.center,
                  color: _swipeItems[index].content.color,
                  child: Text(
                    _swipeItems[index].content.text,
                    style: TextStyle(fontSize: 100),
                  ),
                );
                  },
                  onStackFinished: () {
                    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                      content: Text("Stack Finished"),
                      duration: Duration(milliseconds: 500),
                    ));
                  },
                  itemChanged: (SwipeItem item, int index) {
                    print("item: ${item.content.text}, index: $index");
                  },
                  upSwipeAllowed: true,
                  fillSpace: true,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  ElevatedButton(
                      onPressed: () {
                        _matchEngine!.currentItem?.nope();
                      },
                      child: Text("Nope")),
                  ElevatedButton(
                      onPressed: () {
                        _matchEngine!.currentItem?.superLike();
                      },
                      child: Text("Superlike")),
                  ElevatedButton(
                      onPressed: () {
                        _matchEngine!.currentItem?.like();
                      },
                      child: Text("Like"))
                ],
              )
            ])));
  }
}

class Content {
  final String text;
  final Color color;

  Content({required this.text, required this.color});
}
```

## 🎨 Customization

You can customize the swipe cards with various options:

- **Custom swipe tags**: Add custom widgets that appear during swipe gestures
- **Swipe sensitivity**: Control which swipe directions are allowed
- **Animations**: Built-in smooth animations with elastic effects
- **Callbacks**: Get notified of swipe events and card changes

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request.

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🔗 Links

- [pub.dev package](https://pub.dev/packages/swipe_magic)
- [GitHub Repository](https://github.com/YourUsername/swipe_magic)
- [Issue Tracker](https://github.com/YourUsername/swipe_magic/issues)

## 💝 Support

If you find this package helpful, please give it a ⭐ on GitHub and 👍 on pub.dev!
