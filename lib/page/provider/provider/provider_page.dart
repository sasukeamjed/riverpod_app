import 'package:flutter/material.dart';
import 'package:flutter_riverpod/all.dart';

final numberProvider = Provider<int>((ref)=>42);

class ProviderPage extends ConsumerWidget {
  @override
  Widget build(BuildContext context, watch) {
    final number = watch(numberProvider).toString();
    return Scaffold(
      appBar: AppBar(
        title: Text("Provider"),
      ),
      body: Center(
        child: Text(number),
      ),
    );
  }
}
