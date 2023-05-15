import 'package:flutter/material.dart';
import 'package:scroll_to_top/screens/basic_prompt.dart';
import 'package:scroll_to_top/screens/custom_prompt.dart';
import 'package:scroll_to_top/screens/nested_scroll_example.dart';
import 'package:scroll_to_top/screens/themed_prompt.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const Text('Scroll to top prompt examples'),
          ),
          body: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const BasicPrompt(),
                        ));
                      },
                      child: const Text('Basic Prompt'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const ThemedPrompt(),
                        ));
                      },
                      child: const Text('Themed Prompt'),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const CustomPrompt(),
                        ));
                      },
                      child: const Text('Custom Prompt'),
                    ),
                    const Flexible(
                      child: Divider(
                        color: Colors.grey,
                        thickness: 1,
                        endIndent: 100,
                        indent: 100,
                      ),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        Navigator.of(context).push(MaterialPageRoute(
                          builder: (context) => const NestedScrollViewExample(),
                        ));
                      },
                      child: const Text('NestedScrollView Implementation'),
                    ),
                  ],
                ),
              ),
            ],
          )),
    );
  }
}