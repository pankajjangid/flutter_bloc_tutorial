import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_tutorial/cubits/color/color_cubit.dart';
import 'package:flutter_bloc_tutorial/cubits/counter/counter_cubit.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ColorCubit>(create: (context) => ColorCubit(),),
        BlocProvider<CounterCubit>(create: (context) => CounterCubit(context.read<ColorCubit>()),)
      ],
      child: MaterialApp(
        title: 'Bloc Cubits Communication',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
          useMaterial3: true,
        ),
        home: MyHomePage(),
      ),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.watch<ColorCubit>().state.color,
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text("Bloc Cubits Communication"),
      ),
      body:Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: (){
                context.read<ColorCubit>().changeColor();
              },
              child: const Text(
                'Change Color',style: TextStyle(fontSize: 24),
              ),
            ),
            SizedBox(height: 20,),
            Text(
              '${context.watch<CounterCubit>().state.counter}',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            SizedBox(height: 20,),
            ElevatedButton(onPressed: (){
              context.read<CounterCubit>().updateCounter();
            }, child: Text("Increment counter",style: TextStyle(fontSize: 24),))
          ],
        ),
      ),
    );
  }
}
