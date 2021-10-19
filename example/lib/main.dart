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
              height: 400,
              width: 600,
              child: Expanded(
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
          ),
          StackRoute(
            route: ExampleStackRoutes.secondRoute,
            child: StackRouterScaffold(
              height: 450,
              width: 600,
              appBar: const StackRouterAppBar(
                title: Text("I'm a Title", style: TextStyle(fontSize: 20)),
              ),
              child: Expanded(
                child: Container(
                  color: Colors.blue,
                  alignment: Alignment.center,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      const Text(
                        "I'm the second route",
                        style: TextStyle(
                          color: Colors.white,
                        ),
                      ),
                      const Padding(padding: EdgeInsets.only(top: 16)),
                      ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.white),
                        ),
                        onPressed: () {
                          router.showSnackBar(
                            snackBar: const StackRouterSnackBar(
                              title: Text(
                                "I'm a snackbar!",
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          );
                        },
                        child: const Text(
                          "Show snack bar",
                          style: TextStyle(color: Colors.black),
                        ),
                      ),
                    ],
                  ),
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
