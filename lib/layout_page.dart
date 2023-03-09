import 'package:flutter/material.dart';
import 'package:my_flutter_app/main.dart';

class LayoutPage extends StatefulWidget {
  LayoutPage({Key? key}) : super(key: key);

  @override
  State<LayoutPage> createState() {
    return _LayoutPageState();
  }
}

class _LayoutPageState extends State<LayoutPage> {

  @override
  Widget build(BuildContext context) {

    Widget titleSection = Container(
        padding: const EdgeInsets.all(32),
        child: Row(
          children: [
            Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: const Text(
                        'Oeschinen Lake Campground',
                        style: TextStyle(fontWeight: FontWeight.bold),
                      ),
                    ),
                    Text(
                      'Kandersteg, Switzerland',
                      style: TextStyle(color: Colors.grey[500]),
                    )
                  ],
                ))
            ,
            Icon(
              Icons.star,
              color: Colors.red[500],
            ),
            const Text('41'),
          ],
        ));

    Color color = Theme.of(context).primaryColor;

    Widget buttonSection = Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        ReactableWidget(iconData : Icons.call, label : 'CALL'),
        ReactableWidget(iconData : Icons.near_me, label : 'ROUTE'),
        ReactableWidget(iconData : Icons.share, label : 'SHARE'),
      ],
    );

    Widget textSection = const Padding(
      padding: EdgeInsets.all(32),
      child: Text(
        'Lake Oeschinen lies at the foot of the Blüemlisalp in the Bernese '
        'Alps. Situated 1,578 meters above sea level, it is one of the '
        'larger Alpine Lakes. A gondola ride from Kandersteg, followed by a '
        'half-hour walk through pastures and pine forest, leads you to the '
        'lake, which warms to 20 degrees Celsius in the summer. Activities '
        'enjoyed here include rowing, and riding the summer toboggan run.',
        softWrap: true,
      ),
    );

    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter layout demo'),
      ),
      body: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            children: [
              Image.asset(
                'assets/images/lake.jpg',
                width: 600,
                height: 240,
                fit: BoxFit.cover,
              ),
              titleSection,
              buttonSection,
              textSection
            ],
          )),
    );
  }
}

class ReactableWidget extends StatefulWidget {

  final IconData iconData;
  final String label;

  ReactableWidget({Key? key, required this.iconData, required this.label}) : super(key : key);

  @override
  State createState() {
    return _ReactableWidgetState();
  }
}

class _ReactableWidgetState extends State<ReactableWidget> with SingleTickerProviderStateMixin {

  late double _scale;
  late AnimationController _controller;

  Color color = ThemeData().primaryColor;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: 100),
        upperBound: 0.1,
        lowerBound: 0,
        value: 0,
    )..addListener(() {
      setState(() {

      });
    });
  }

  @override
  void dispose() {
    super.dispose();
    _controller.dispose();
  }

  @override
  Widget build(BuildContext context) {
    _scale = 1 - _controller.value;

    return GestureDetector(
          onTapDown: _tapDown,
          onTapUp: _tapUp,
          child: Transform.scale(
            scale: _scale,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(widget.iconData, color: color),
                Container(
                    margin: const EdgeInsets.only(top: 8),
                    child: Text(
                        widget.label,
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                          color: color,
                        )
                    )
                )
              ],
            )
          )
      );
  }

  void _tapDown(TapDownDetails details) {
    _controller.forward();
  }

  void _tapUp(TapUpDetails details) {
    _controller.reverse();
  }
}