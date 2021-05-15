import 'dart:async';
import 'package:flutter/material.dart';
import 'package:new_weather_app/presentation/base/base_result.dart';
import 'package:new_weather_app/presentation/controllers/base_controller.dart';
import 'package:provider/provider.dart';

abstract class BasePage extends StatefulWidget {}

abstract class BaseState<T extends BaseController, Page extends BasePage>
    extends State<Page> {
  T bloc;

  StreamController<BaseResultStream> streamController;
  Stream<BaseResultStream> stream;

  @override
  didChangeDependencies() {
    _init();
    super.didChangeDependencies();
  }

  _init() {
    if (bloc == null) {
      final blokmens = Provider.of<T>(context);
      bloc = blokmens;

      if (bloc.stream != null) {
        streamController = bloc.stream;
        stream = streamController.stream;
        stream.listen(onStateResultListener);
      }

      initBloc(bloc);
    }
  }

  initBloc(T bloc);

  onStateResultListener(BaseResultStream result);

  @override
  dispose() {
    streamController.close();
    streamController = null;
    stream = null;
    super.dispose();
  }
}
