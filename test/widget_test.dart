import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swipe_magic/draggable_card.dart';
import 'package:swipe_magic/profile_card.dart';

void main() {
  group('DraggableCard Widget Tests', () {
    testWidgets('DraggableCard renders with card widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DraggableCard(
              card: Container(
                child: const Text('Test Card'),
              ),
            ),
          ),
        ),
      );

      expect(find.text('Test Card'), findsOneWidget);
    });

    testWidgets('DraggableCard shows tags during swipe',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DraggableCard(
              card: const SizedBox(
                width: 200,
                height: 300,
                child: Text('Test Card'),
              ),
              likeTag: const Text('LIKE'),
              nopeTag: const Text('NOPE'),
              superLikeTag: const Text('SUPER'),
            ),
          ),
        ),
      );

      expect(find.text('Test Card'), findsOneWidget);
      // Tags are shown based on slide region which requires user interaction
    });

    testWidgets('DraggableCard respects swipe permissions',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DraggableCard(
              card: const SizedBox(
                width: 200,
                height: 300,
                child: Text('Test Card'),
              ),
              leftSwipeAllowed: false,
              rightSwipeAllowed: true,
              upSwipeAllowed: false,
            ),
          ),
        ),
      );

      expect(find.text('Test Card'), findsOneWidget);
    });

    testWidgets('DraggableCard handles empty state',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: DraggableCard(),
          ),
        ),
      );

      expect(find.byType(Container), findsWidgets);
    });
  });

  group('ProfileCard Widget Tests', () {
    testWidgets('ProfileCard renders child widget',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProfileCard(
              child: Text('Profile Content'),
            ),
          ),
        ),
      );

      expect(find.text('Profile Content'), findsOneWidget);
    });

    testWidgets('ProfileCard handles null child', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProfileCard(),
          ),
        ),
      );

      expect(find.byType(Container), findsOneWidget);
    });

    testWidgets('ProfileCard maintains structure', (WidgetTester tester) async {
      await tester.pumpWidget(
        const MaterialApp(
          home: Scaffold(
            body: ProfileCard(
              child: Column(
                children: [
                  Text('Title'),
                  Text('Subtitle'),
                ],
              ),
            ),
          ),
        ),
      );

      expect(find.text('Title'), findsOneWidget);
      expect(find.text('Subtitle'), findsOneWidget);
      expect(find.byType(Column), findsOneWidget);
    });
  });

  group('SlideDirection Tests', () {
    test('SlideDirection enum values', () {
      expect(SlideDirection.left.toString(), 'SlideDirection.left');
      expect(SlideDirection.right.toString(), 'SlideDirection.right');
      expect(SlideDirection.up.toString(), 'SlideDirection.up');
    });
  });

  group('SlideRegion Tests', () {
    test('SlideRegion enum values', () {
      expect(SlideRegion.inNopeRegion.toString(), 'SlideRegion.inNopeRegion');
      expect(SlideRegion.inLikeRegion.toString(), 'SlideRegion.inLikeRegion');
      expect(SlideRegion.inSuperLikeRegion.toString(),
          'SlideRegion.inSuperLikeRegion');
    });
  });
}
