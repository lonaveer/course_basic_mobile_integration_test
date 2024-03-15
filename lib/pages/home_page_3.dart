import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:my_flutter_app/controllers/counter_controller.dart';

void main() => runApp(HomePage3App());

class HomePage3App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  final CounterController controller = Get.put(CounterController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('GetX Counter')),
      body: Center(
        child: Obx(() => Text('Count: ${controller.count}', key: Key('counterText'))),
      ),
      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          FloatingActionButton(
            key: Key('incrementButton'),
            onPressed: controller.increment,
            child: Icon(Icons.add),
          ),
          SizedBox(width: 10), // ระยะห่างระหว่างปุ่ม
          FloatingActionButton(
            key: Key('decrementButton'),
            onPressed: controller.decrement,
            child: Icon(Icons.remove),
          ),
        ],
      ),
    );
  }
}