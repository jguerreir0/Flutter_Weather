import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:new_weather_app/presentation/base/base.dart';

abstract class BaseController extends ChangeNotifier {
  StreamController<BaseResultStream> stream;
  disposeBloc() {
    stream.close();
  }
}
