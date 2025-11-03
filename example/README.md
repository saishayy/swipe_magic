# Swipe Magic Example App 🎯

This example demonstrates how to use the `swipe_magic` package to create Tinder-like swipe cards in Flutter.

## 🚀 Features Demonstrated

- ✨ Basic swipe card implementation
- 🎨 Custom swipe tags (Like, Nope, Super Like)
- 🎮 Manual swipe controls with buttons
- 📱 Responsive design for different screen sizes
- 🔧 Configurable swipe directions

## 🏃‍♂️ Running the Example

1. **Navigate to the example directory:**
   ```bash
   cd example
   ```

2. **Install dependencies:**
   ```bash
   flutter pub get
   ```

3. **Run the app:**
   ```bash
   flutter run
   ```

## 📋 What's Included

### Main Features:
- **SwipeCards Widget**: Demonstrates the core swipe functionality
- **Custom Tags**: Shows how to implement custom visual feedback during swipes
- **Manual Controls**: Buttons to programmatically trigger swipe actions
- **Callbacks**: Shows how to handle swipe events and stack completion
- **Multiple Cards**: Example with 8 different colored cards

### Code Structure:
- `lib/main.dart` - Main application with SwipeCards implementation
- `lib/content.dart` - Content model for card data

## 🎨 Customization Examples

The example app shows various customization options:

```dart
SwipeCards(
  matchEngine: _matchEngine,
  itemBuilder: (context, index) => YourCardWidget(),
  likeTag: Container(/* Custom like indicator */),
  nopeTag: Container(/* Custom nope indicator */),
  superLikeTag: Container(/* Custom super like indicator */),
  leftSwipeAllowed: true,
  rightSwipeAllowed: true,
  upSwipeAllowed: true,
  onStackFinished: () => print('All cards swiped!'),
  itemChanged: (item, index) => print('Card changed: $index'),
)
```

## 🔧 Configuration Options

The example demonstrates how to configure:
- **Swipe Directions**: Enable/disable left, right, and up swipes
- **Visual Feedback**: Custom tags that appear during swipe gestures
- **Event Handling**: Callbacks for swipe actions and stack events
- **Manual Controls**: Programmatic swipe triggering via buttons

## 📱 Testing on Different Platforms

This example has been tested on:
- ✅ Android (API 21+)
- ✅ iOS (iOS 11.0+)
- ✅ Web
- ✅ Desktop (Windows, macOS, Linux)

## 🆘 Troubleshooting

### Common Issues:

1. **Cards not responding to swipes:**
   - Ensure `isDraggable` is set to `true` (default)
   - Check that swipe directions are enabled

2. **Performance issues:**
   - Reduce card content complexity
   - Use `const` constructors where possible

3. **Layout issues:**
   - Set appropriate `height` for the SwipeCards container
   - Use `fillSpace: true` for full-screen cards

## 🔗 Related Resources

- [Package Documentation](https://pub.dev/packages/swipe_magic)
- [API Reference](https://pub.dev/documentation/swipe_magic/latest/)
- [GitHub Repository](https://github.com/YourUsername/swipe_magic)

## 🤝 Contributing

Found an issue with the example or want to add more features? Please check our [Contributing Guide](../CONTRIBUTING.md).

---

Happy Swiping! 🎉
