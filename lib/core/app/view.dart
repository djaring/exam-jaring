export 'package:mobile_exam/core/extensions/common.dart';

import 'package:flutter/material.dart';

class View extends StatefulWidget {
  final Widget Function(BuildContext context) content;

  const View({Key? key, required this.content}) : super(key: key);

  @override
  State<View> createState() => _ViewState();
}

class _ViewState extends State<View> {
  @override
  Widget build(BuildContext context) {
    return widget.content(context);
  }
}

abstract class ViewState {
  final Key? key;

  ViewState({this.key});
  Widget content(BuildContext context);

  Widget view(BuildContext context) {
    return View(key: key, content: content);
  }
}
