import 'package:flutter/material.dart';
void main() {
  runApp( MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      darkTheme: ThemeData.lerp(ThemeData.light(), ThemeData.dark(),1.1),themeMode: ThemeMode.dark,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Visual(),
    );
  }
}

class Visual extends StatefulWidget {
  @override
  State<Visual> createState() => _VisualState();
}

class _VisualState extends State<Visual> {
  List<Color> colorList=[Colors.red, Colors.yellow, Colors.blue, Colors.greenAccent,Colors.red];
  List<int> durationList=[900,700,800,600,800];

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: List<Widget>.generate(10, (index) =>
            MyHomePage(duration: durationList[index%5], color: colorList[index%4])
        ),

      ),
    );
  }
}


class MyHomePage extends StatefulWidget {
  final int duration;
  final Color color;
  MyHomePage({required this.duration,required this.color});
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> with TickerProviderStateMixin{
  late Animation<double> animation;
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    //int dur=widget.duration/10;
    controller=AnimationController(vsync: this,duration: Duration(milliseconds: widget.duration));
    animation=CurvedAnimation(parent: controller, curve: Curves.bounceInOut);
    animation=Tween<double>(
      begin: 0,end: 1
    ).animate(animation)..addListener(() {setState((){
    });});
    controller.repeat(reverse: true);
  }
  @override
  Widget build(BuildContext context) {
    return Center(
        child: Container(
          width: 10,height: animation.value*100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(5),
            color: widget.color,
          ),
        ),
      );
  }
}


