import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/all.dart';



void main(){
  runApp(ProviderScope(child: MyApp()));
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}

class Counter{
  final int count;

  const Counter(this.count);
}

class CountNotifier extends StateNotifier<Counter>{
  CountNotifier() : super(_initialValue);
  static const _initialValue = Counter(0);

  increment(){
    state = Counter(state.count + 1);
  }
}

final provider = StateNotifierProvider((ref)=> CountNotifier());

class MyHome extends HookWidget {
  @override
  Widget build(BuildContext context) {
    final counter = useProvider(provider.state);
    return Scaffold(
      appBar: AppBar(
        title: Text("RiverPod"),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("This is how many times the button is clicked:"),
            Text("${counter.count}"),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: (){
          context.read(provider).increment();
        },
      ),
    );
  }
}

