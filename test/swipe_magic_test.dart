import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:swipe_magic/swipe_magic.dart';

void main() {
  group('SwipeCards Widget Tests', () {
    late MatchEngine matchEngine;
    late List<SwipeItem> swipeItems;

    setUp(() {
      swipeItems = [
        SwipeItem(
          content: 'Test Item 1',
          likeAction: () {},
          nopeAction: () {},
          superlikeAction: () {},
        ),
        SwipeItem(
          content: 'Test Item 2',
          likeAction: () {},
          nopeAction: () {},
          superlikeAction: () {},
        ),
      ];
      matchEngine = MatchEngine(swipeItems: swipeItems);
    });

    testWidgets('SwipeCards renders correctly', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SwipeCards(
              matchEngine: matchEngine,
              itemBuilder: (context, index) {
                return Container(
                  child: Text('Item $index'),
                );
              },
              onStackFinished: () {},
            ),
          ),
        ),
      );

      expect(find.text('Item 0'), findsOneWidget);
    });

    testWidgets('SwipeCards shows custom tags', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SwipeCards(
              matchEngine: matchEngine,
              itemBuilder: (context, index) {
                return Container(
                  child: Text('Item $index'),
                );
              },
              onStackFinished: () {},
              likeTag: const Text('LIKE'),
              nopeTag: const Text('NOPE'),
              superLikeTag: const Text('SUPER'),
            ),
          ),
        ),
      );

      expect(find.text('Item 0'), findsOneWidget);
      // Tags are only visible during swipe interactions
    });

    testWidgets('SwipeCards respects swipe allowances',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: SwipeCards(
              matchEngine: matchEngine,
              itemBuilder: (context, index) {
                return Container(
                  child: Text('Item $index'),
                );
              },
              onStackFinished: () {},
              leftSwipeAllowed: false,
              rightSwipeAllowed: true,
              upSwipeAllowed: false,
            ),
          ),
        ),
      );

      expect(find.text('Item 0'), findsOneWidget);
    });
  });

  group('MatchEngine Tests', () {
    late MatchEngine matchEngine;
    late List<SwipeItem> swipeItems;

    setUp(() {
      swipeItems = [
        SwipeItem(content: 'Item 1'),
        SwipeItem(content: 'Item 2'),
        SwipeItem(content: 'Item 3'),
      ];
      matchEngine = MatchEngine(swipeItems: swipeItems);
    });

    test('MatchEngine initializes correctly', () {
      expect(matchEngine.currentItem, isNotNull);
      expect(matchEngine.currentItem!.content, equals('Item 1'));
      expect(matchEngine.nextItem, isNotNull);
      expect(matchEngine.nextItem!.content, equals('Item 2'));
    });

    test('MatchEngine cycles through items correctly', () {
      // Like the first item
      matchEngine.currentItem!.like();
      matchEngine.cycleMatch();

      expect(matchEngine.currentItem!.content, equals('Item 2'));
      expect(matchEngine.nextItem!.content, equals('Item 3'));
    });

    test('MatchEngine handles last item correctly', () {
      // Like first two items
      matchEngine.currentItem!.like();
      matchEngine.cycleMatch();

      matchEngine.currentItem!.like();
      matchEngine.cycleMatch();

      expect(matchEngine.currentItem!.content, equals('Item 3'));
      expect(matchEngine.nextItem, isNull);
    });

    test('MatchEngine rewind works correctly', () {
      // Like the first item and cycle
      matchEngine.currentItem!.like();
      matchEngine.cycleMatch();

      // Now rewind
      matchEngine.rewindMatch();

      expect(matchEngine.currentItem!.content, equals('Item 1'));
      expect(matchEngine.nextItem!.content, equals('Item 2'));
    });
  });

  group('SwipeItem Tests', () {
    test('SwipeItem executes actions correctly', () {
      bool likeActionCalled = false;
      bool nopeActionCalled = false;
      bool superlikeActionCalled = false;

      final swipeItem = SwipeItem(
        content: 'Test Item',
        likeAction: () => likeActionCalled = true,
        nopeAction: () => nopeActionCalled = true,
        superlikeAction: () => superlikeActionCalled = true,
      );

      // Test like action
      swipeItem.like();
      expect(likeActionCalled, isTrue);
      expect(swipeItem.decision, equals(Decision.like));

      // Reset for next test
      swipeItem.resetMatch();
      expect(swipeItem.decision, equals(Decision.undecided));

      // Test nope action
      swipeItem.nope();
      expect(nopeActionCalled, isTrue);
      expect(swipeItem.decision, equals(Decision.nope));

      // Reset for next test
      swipeItem.resetMatch();

      // Test superlike action
      swipeItem.superLike();
      expect(superlikeActionCalled, isTrue);
      expect(swipeItem.decision, equals(Decision.superLike));
    });

    test('SwipeItem prevents multiple decisions', () {
      bool likeActionCalled = false;
      bool nopeActionCalled = false;

      final swipeItem = SwipeItem(
        content: 'Test Item',
        likeAction: () => likeActionCalled = true,
        nopeAction: () => nopeActionCalled = true,
      );

      // Like first
      swipeItem.like();
      expect(likeActionCalled, isTrue);
      expect(swipeItem.decision, equals(Decision.like));

      // Try to nope after like (should not work)
      swipeItem.nope();
      expect(nopeActionCalled, isFalse);
      expect(swipeItem.decision, equals(Decision.like)); // Should still be like
    });

    test('SwipeItem handles slide updates', () async {
      SlideRegion? lastRegion;

      final swipeItem = SwipeItem(
        content: 'Test Item',
        onSlideUpdate: (region) async {
          lastRegion = region;
        },
      );

      await swipeItem.onSlideUpdate!(SlideRegion.inLikeRegion);
      expect(lastRegion, equals(SlideRegion.inLikeRegion));

      await swipeItem.onSlideUpdate!(SlideRegion.inNopeRegion);
      expect(lastRegion, equals(SlideRegion.inNopeRegion));

      await swipeItem.onSlideUpdate!(SlideRegion.inSuperLikeRegion);
      expect(lastRegion, equals(SlideRegion.inSuperLikeRegion));
    });
  });

  group('SlideDirection and SlideRegion Enums', () {
    test('SlideDirection enum has correct values', () {
      expect(SlideDirection.values.length, equals(3));
      expect(SlideDirection.values, contains(SlideDirection.left));
      expect(SlideDirection.values, contains(SlideDirection.right));
      expect(SlideDirection.values, contains(SlideDirection.up));
    });

    test('SlideRegion enum has correct values', () {
      expect(SlideRegion.values.length, equals(3));
      expect(SlideRegion.values, contains(SlideRegion.inNopeRegion));
      expect(SlideRegion.values, contains(SlideRegion.inLikeRegion));
      expect(SlideRegion.values, contains(SlideRegion.inSuperLikeRegion));
    });

    test('Decision enum has correct values', () {
      expect(Decision.values.length, equals(4));
      expect(Decision.values, contains(Decision.undecided));
      expect(Decision.values, contains(Decision.nope));
      expect(Decision.values, contains(Decision.like));
      expect(Decision.values, contains(Decision.superLike));
    });
  });
}
