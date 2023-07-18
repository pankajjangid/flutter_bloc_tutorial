import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/counter_page.dart';
import 'package:flutter_bloc_tutorial/cubits/counter/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    final CounterCubit counterCubit = CounterCubit();
    return MaterialApp(
      title: 'Name Routes Access Cubit',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      initialRoute: '/',
      routes: {
        '/counter': (context) =>
            BlocProvider.value(
              value: counterCubit,
              child: CounterPage(),
            ),
      },
      home: BlocProvider(
        create: (context) => counterCubit,
        child: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int incrementSize = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .inversePrimary,
        title: Text("Name Routes Access Cubit"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(
                    context,
                    '/counter'
                );
              },
              child: const Text(
                'Show me counter',
                style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            ElevatedButton(
                onPressed: () {
                  context.read<CounterCubit>().updateCounter(incrementSize);
                },
                child: Text(
                  "Increment counter",
                  style: TextStyle(fontSize: 24),
                ))
          ],
        ),
      ),
    );
  }
}
