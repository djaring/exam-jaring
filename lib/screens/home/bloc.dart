export 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/bloc.dart' as base;
import 'package:mobile_exam/core/services/server.dart';

import 'views/main.dart' as main_view;

extension Extension on BuildContext {
  Bloc get bloc => read<Bloc>();
}

class Bloc extends base.Bloc {
  Bloc(BuildContext context) : super(main_view.ViewState(), context: context);

  late final Server service;

  @override
  void init() {
    service = context.server;
  }

  Future<int> get serverKey => service.accessKey;
}
