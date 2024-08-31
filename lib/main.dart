import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Responsive Web App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Responsive Web App'),
        backgroundColor: Colors.green, // Change app bar color here
        toolbarHeight: 80, // Increase the size of the app bar
        actions: const [
          AppBarLink(title: 'Home'),
          SizedBox(width: 20), // Add space between items
          AppBarLink(title: 'About'),
          SizedBox(width: 20), // Add space between items
          AppBarLink(title: 'Login'),
          SizedBox(width: 20), // Add space between items
          AppBarLink(title: 'Model'),
          SizedBox(width: 20), // Add space between items
          AppBarLink(title: 'Contact'),
        ],
      ),
      body: Stack(
        children: [
          Positioned.fill(
            child: Image.asset(
              'assets/ai.png', // Provide your image path here
              fit: BoxFit.cover,
            ),
          ),
          LayoutBuilder(
            builder: (context, constraints) {
              if (constraints.maxWidth < 600) {
                return buildMobileLayout();
              } else {
                return buildWebLayout();
              }
            },
          ),
        ],
      ),
    );
  }

  Widget buildMobileLayout() {
    return const Center(
      child: Text(
        'Mobile Layout',
        style: TextStyle(fontSize: 24),
      ),
    );
  }

  Widget buildWebLayout() {
    return const Center();
  }
}

class AppBarLink extends StatelessWidget {
  final String title;

  const AppBarLink({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0),
      child: GestureDetector(
        onTap: () {
          // Handle tap actions here (e.g., navigation)
          print('Tapped $title');
        },
        child: Text(
          title,
          style: const TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
