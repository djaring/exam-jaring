export 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:mobile_exam/core/app/bloc.dart' as base;
import 'package:mobile_exam/core/extensions/common.dart';
import 'package:mobile_exam/core/extensions/map.dart';
import 'package:mobile_exam/core/services/server.dart';

import 'views/main.dart' as main_view;
import 'views/loading.dart' as loading_view;
import 'views/error.dart' as error_view;

extension Extension on BuildContext {
  Bloc get bloc => read<Bloc>();
}

class Bloc extends base.Bloc {
  Bloc(BuildContext context) : super(loading_view.ViewState(), context: context);

  @override
  void init() async {
    final arg = context.arguments;
    final key = arg?.tryGet("key");
    final service = context.server;

    var data = await service.data;
    var statusCode = data['status_code'];

    if (key != await service.accessKey) {
      emit(error_view.ViewState());
      return;
    } else {
      if (statusCode == 503) {
        emit(error_view.ViewState());
      } else {
        emit(main_view.ViewState(data: data));
      }
    }
  }

  Future runCount() async {
    final service = context.server;
    var data = await service.data;
    await context.server.addToCount(1);
    emit(main_view.ViewState(data: data));
  }
}


