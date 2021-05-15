import 'package:flutter/material.dart';
import 'package:new_weather_app/presentation/controllers/controllers.dart';
import 'package:new_weather_app/presentation/ui/views.dart';
import 'package:provider/provider.dart';

class Routes {
  static final String home = '/';
  static final String citySelection = '/city/selection';

  static Map<String, WidgetBuilder> routes = {
    home: (context) => MultiProvider(providers: [
          ChangeNotifierProvider<BaseHomePageController>.value(
            value: HomePageController(),
          )
        ], child: HomePage()),
    citySelection: (context) => CitySelection(),
  };
}
