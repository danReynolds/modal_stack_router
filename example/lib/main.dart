import 'package:flutter/material.dart';
import 'package:modal_stack_router/modal_stack_router.dart';

class ExampleStackRoutes {
  static const String firstRoute = 'firstRoute';
  static const String secondRoute = 'secondRoute';
}

class ExampleStackRouter extends StatelessWidget {
  const ExampleStackRouter({
    Key? key,
  }) : super(key: key);

  @override
  build(context) {
    return StackRouter(
      initialRoute: ExampleStackRoutes.firstRoute,
      builder: (router) {
        return [
          StackRoute(
            route: ExampleStackRoutes.firstRoute,
            child: StackRouterScaffold(
              height: 500,
              width: 500,
              alignment: Alignment.center,
              child: Center(
                child: ElevatedButton(
                  onPressed: () {
                    router.pushRoute(ExampleStackRoutes.secondRoute);
                  },
                  child: const Text(
                    "Go to second route",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          ),
          StackRoute(
            route: ExampleStackRoutes.secondRoute,
            child: StackRouterScaffold(
              height: 400,
              width: 400,
              appBar: StackRouterAppBar(
                title: Text(
                  "Title",
                  style: Theme.of(context).textTheme.headline1!.copyWith(
                        fontSize: 24,
                        fontWeight: FontWeight.bold,
                      ),
                ),
                trailing: TextButton(
                  child: Text("Trailing action"),
                  onPressed: () {},
                ),
              ),
              child: Expanded(
                child: Center(
                  child: Text("I'm the second route!"),
                ),
              ),
            ),
          ),
        ];
      },
    );
  }
}

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      body: Center(
        child: ElevatedButton(
          child: const Text('Open modal stack router'),
          onPressed: () {
            showModalStackRouter(
              context: context,
              child: const ExampleStackRouter(),
            );
          },
        ),
      ),
    );
  }
}
