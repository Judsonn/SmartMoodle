import 'package:flutter/material.dart';
import 'package:SmartMoodle/pages/evaluations/open/my_evaluations_content.dart';
import 'package:SmartMoodle/pages/widgets/drawer_widget.dart';

class MyEvaluationsPage extends StatefulWidget {
  @override
  _MyEvaluationsPageState createState() => _MyEvaluationsPageState();
}

class _MyEvaluationsPageState extends State<MyEvaluationsPage> with SingleTickerProviderStateMixin {
  AnimationController controller;

  Animation animationTranslate;
  Animation animationSize;
  Animation animationSizeBorder;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(duration: Duration(milliseconds: 500), vsync: this);

    animationTranslate =
        Tween(begin: 0.0, end: 300.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    animationTranslate.addListener(() {
      setState(() {});
    });

    animationSize = Tween(begin: 1.0, end: 0.8).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    animationSize.addListener(() {
      setState(() {});
    });

    animationSizeBorder =
        Tween(begin: 0.0, end: 10.0).animate(CurvedAnimation(parent: controller, curve: Curves.easeOut));
    animationSizeBorder.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  _onTapMenu() {
    if (controller.value == 1) {
      controller.reverse();
    } else {
      controller.forward();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        DrawerWidget(3), //widget do drawer
        Transform.scale(
          scale: animationSize.value,
          child: Container(
              transform: Matrix4.identity()..translate(animationTranslate.value, 0.0),
              child: ClipRRect(
                  borderRadius: BorderRadius.circular(animationSizeBorder.value),
                  child: MyEvaluationsContentPage(
                    onTap: _onTapMenu,
                  ))),
        ) //tela inicial
      ],
    );
  }
}
