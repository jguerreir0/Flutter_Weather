import 'package:flutter/material.dart';
import 'package:new_weather_app/presentation/base/base.dart';
import 'package:new_weather_app/presentation/controllers/controllers.dart';
import 'package:new_weather_app/presentation/result/result_streams.dart';
import 'package:new_weather_app/presentation/result/weather_result_stream.dart';
import 'package:new_weather_app/presentation/ui/components/weather_details_widget.dart';

import '../../routes.dart';

class HomePage extends BasePage {
  @override
  HomePageState createState() => HomePageState();
}

class HomePageState extends BaseState<BaseHomePageController, HomePage> {
  bool isRequesting = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter Weather'),
        actions: <Widget>[
          IconButton(
            icon: Icon(Icons.search),
            onPressed: () async {
              final city =
                  await Navigator.pushNamed(context, Routes.citySelection);
              if (city != null) {
                bloc.getLocation(city);
              }
            },
          )
        ],
      ),
      body: Center(
          child: isRequesting
              ? CircularProgressIndicator()
              : bloc.weather == null
                  ? Text('No Location')
                  : WeatherDetailsWidget(weather: bloc.weather)),
    );
  }

  @override
  initBloc(BaseHomePageController bloc) {}

  @override
  onStateResultListener(BaseResultStream result) {
    if (result is LocationResultStream) {
      switch (result.state) {
        case Status.request:
          print('TOU AKI');
          setState(() {
            isRequesting = true;
          });
          break;
        case Status.loading:
          break;
        case Status.success:
          print('SUCCESS CITY');

          print('${result.data}');
          bloc.getWeather(result.data);
          break;
        case Status.fail:
          print('FAIL CITY');
          setState(() {
            isRequesting = false;
          });
          print('${result.error}');
          break;
      }
    }

    if (result is WeatherResultStream) {
      switch (result.state) {
        case Status.request:
          break;
        case Status.loading:
          break;
        case Status.success:
          print('SUCCESS WEATHER');
          bloc.setWeather(result.data);
          setState(() {
            isRequesting = false;
          });
          break;
        case Status.fail:
          print('FAIL WEATHER');
          setState(() {
            isRequesting = false;
          });
          print('${result.error}');
          break;
      }
    }
  }
}
