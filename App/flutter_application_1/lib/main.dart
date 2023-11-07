import 'package:flutter/material.dart';

void main() => runApp(const App());

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(brightness: Brightness.dark),
      themeMode: ThemeMode.system,
      home: const AppHome(),
    );
  }
}

class AppHome extends StatelessWidget {
  const AppHome({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login"),
        leading: const Icon(Icons.ondemand_video),
      ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add_shopping_cart_outlined),
        onPressed: () {},
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: ListView(
          children: [
            Text("Heading", style: Theme.of(context).textTheme.displayLarge),
            Text("Sub-Heading",
                style: Theme.of(context).textTheme.displayMedium),
            Text("Paragraph", style: Theme.of(context).textTheme.displaySmall),
            ElevatedButton(
                onPressed: () {},
                child: const Text(
                  "Elevated Button",
                )),
            OutlinedButton(
                onPressed: () {}, child: const Text("Outlined Button")),
            //const Padding(padding: EdgeInsets.all(20.0),
            //child: Image(image: AssetImage(null)),),
          ],
        ),
      ),
    );
  }
}
