import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/scheduler.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const <Widget>[
            KeepRenderingWidget(),
          ],
        ),
      ),
    );
  }
}

class _KeepRenderingWidget extends RenderBox {
  int? _frameCallbackId;

  @override
  void performLayout() {
    size = constraints.constrain(const Size(100, 100));
  }

  @override
  void detach() {
    print('detach');
    super.detach();
  }

  @override
  void dispose() {
    print('dispose');
    final callbackId = _frameCallbackId;
    if (callbackId != null) {
      SchedulerBinding.instance.cancelFrameCallbackWithId(callbackId);
    }
    super.dispose();
  }

  @override
  void attach(PipelineOwner owner) {
    print('attach');
    super.attach(owner);
  }

  void repaint(Duration duration) {
    markNeedsPaint();
  }

  void scheduleRepaint() {
    _frameCallbackId = SchedulerBinding.instance.scheduleFrameCallback(
      repaint,
    );
  }

  @protected
  @override
  void paint(PaintingContext context, Offset offset) {
    scheduleRepaint();

    final random = Random();
    final jitter = random.nextDouble() * 10;

    context.canvas.save();
    context.canvas.drawCircle(
      const Offset(50, 50),
      50 + jitter,
      Paint()..color = Colors.black,
    );
    context.canvas.drawCircle(
      const Offset(150, 150),
      50 + jitter,
      Paint()..color = Colors.red,
    );
    context.canvas.restore();
  }
}

class KeepRenderingWidget extends LeafRenderObjectWidget {
  const KeepRenderingWidget({
    Key? key,
  }) : super(key: key);

  @override
  @protected
  void didUnmountRenderObject(covariant RenderObject renderObject) {
    print('didUnmountRenderObject');
    super.didUnmountRenderObject(renderObject);
  }

  @override
  RenderObject createRenderObject(BuildContext context) {
    return _KeepRenderingWidget();
  }
}
