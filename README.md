# Flutter Scroll To Top

A wrapper to show a scroll to top prompt to the user on ScrollView widgets.

## Installing

Add the following dependency to your pubspec.yaml file:

   ```
   dependencies:
  flutter_scroll_to_top: ^2.2.4
   ```

Import the package

   ```
   import 'package:flutter_scroll_to_top/flutter_scroll_to_top.dart';
   ```

## ScrollWrapper

Just wrap the scrollable widget you want to show the scroll to top prompt over with a ScrollWrapper.

   ```
   ScrollWrapper(
    builder: (context, properties) => ListView.builder(
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
                title: Text('Tile $index'),
                tileColor: Colors.grey.shade200,
            ),
        ),
    ),
)
   ```

## ScrollView Properties

If the child ScrollView has different properties for scrollController, scrollDirection, primary or reverse parameters than the default values, you need to pass them to the ScrollWrapper widget as it requires the same parameters. It provides a ScrollViewProperties object in the builder callback that you can use to access the properties in the ScrollView widget.

   ```
   ScrollWrapper(
    primary: true,
    scrollDirection: Axis.horizontal,
    reverse: true,
    builder: (context, properties) => ListView.builder(
        controller: properties.scrollController,
        scrollDirection: properties.scrollDirection,
        reverse: properties.reverse,
        primary: properties.primary,
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
                title: Text('Tile $index'),
                tileColor: Colors.grey.shade200,
            ),
        ),
    ),
)
   ```

## Customisation

You can pass the following parameters to customise the prompt accordingly

1. enabledAtOffset - At what scroll offset to enable the prompt on.

2. alwaysVisibleAtOffset - If the prompt is to be always visible at the provided offset. Setting this to false only shows the prompt when the user starts scrolling upwards. Default value is false.

3. scrollOffsetUntilVisible - Offset should the user scroll in the opposite direction before the prompt becomes visible.

4. scrollOffsetUntilHide - Offset should the user scroll before the prompt hides itself, if visible.

5. promptAlignment - Where on the widget to align the prompt.

6. promptDuration - Duration it takes for the prompt to come into view/vanish.

7. promptAnimationCurve - Animation Curve that the prompt will follow when coming into view.

8. promptAnimationType - PromptAnimation that the prompt follows when animating. Has three options, fade, scale and size.

9. scrollToTopDuration - Duration it takes for the page to scroll to the top on prompt button press.

10. scrollToTopCurve - Animation Curve for scrolling to the top.

11. promptTheme - You can pass PromptButtonTheme to modify the prompt button further. It has the following parameters:
padding - Padding around the prompt button.
iconPadding - Padding around the icon inside the button.
icon - The icon inside the button.
color - Color of the prompt button.
elevation - Elevation of the button.

   ```
   ScrollWrapper(
    promptAlignment: Alignment.topCenter,
    promptAnimationCurve: Curves.elasticInOut,
    promptDuration: const Duration(milliseconds: 400),
    enabledAtOffset: 300,
    scrollOffsetUntilVisible: 500,
    promptTheme: const PromptButtonTheme(
    icon: Icon(Icons.arrow_circle_up, color: Colors.amber),
    color: Colors.deepPurpleAccent,
    iconPadding: EdgeInsets.all(16),
    padding: EdgeInsets.all(32)),
    builder: (context, properties) => ListView.builder(
        controller: properties.scrollController,
        scrollDirection: properties.scrollDirection,
        reverse: properties.reverse,
        primary: properties.primary,
            itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
                title: Text('Tile $index'),
                tileColor: Colors.grey.shade200,
            ),
        ),
    ),
   )
   ```
   
## Custom Prompt Widget

You can replace the default prompt widget with a widget of your choosing by passing it off in the promptReplacementBuilder parameter.

   ```
   ScrollWrapper(
    promptReplacementBuilder: (context, function) => MaterialButton(
        onPressed: () => function(),
        child: const Text('Scroll to top'),
    ),
    builder: (context, properties) => ListView.builder(
        controller: properties.scrollController,
        scrollDirection: properties.scrollDirection,
        reverse: properties.reverse,
        primary: properties.primary,
        itemBuilder: (context, index) => Padding(
            padding: const EdgeInsets.all(8.0),
            child: ListTile(
                title: Text('Tile $index'),
                tileColor: Colors.grey.shade200,
            ),
        ),
    ),
)
   ```


