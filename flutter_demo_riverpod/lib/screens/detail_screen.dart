import 'package:flutter/material.dart';
import 'package:flutter_demo_riverpod/provider.dart';
import 'package:flutter_demo_riverpod/screens/main_screen.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class DetailScreen extends ConsumerStatefulWidget {
  const DetailScreen({super.key});

  static String routeName = '/detail_screen';

  @override
  ConsumerState<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends ConsumerState<DetailScreen> {
  @override
  Widget build(BuildContext context) {
    final counterProv = ref.watch(counterProvider);

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('Detail'),
        leading: IconButton(
          onPressed: () {
            Navigator.push(
                context, MaterialPageRoute(builder: (context) => MyHomePage()));
            setState(() {});
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button in the previous screen this many times:',
            ),
            Text(
              counterProv.getCounter().toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              onPressed: () {
                setState(() {
                  // FIXME: The counter is not updated in the main screen
                  counterProv.resetCounter();
                });
              },
              child: const Text('Clear Data'),
            ),
          ],
        ),
      ),
    );
  }
}
