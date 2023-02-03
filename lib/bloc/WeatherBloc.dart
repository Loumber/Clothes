import 'package:clothes/events/WeatherEvent.dart';
import 'package:clothes/models/Weather.dart';
import 'package:clothes/services/WeatherService.dart';
import 'package:clothes/states/WeatherState.dart';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  //final String cityName;
  WeatherBloc() : super(null) {
    add(WeatherCurrentPositionRequested());
  }

  // @override
  // Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
  //   if (event is WeatherRequested) {
  //     yield WeatherLoadInProgress();
  //     try {
  //       final Weather weather =
  //       await WeatherService.fetchCurrentWeather(query: event.city);
  //       yield WeatherLoadSuccess(
  //           weather: weather);
  //     } catch (_) {
  //       yield WeatherLoadFailure();
  //     }
  //   }
  // }
  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequested) {
      yield* _newWeatherRequested(event);
    }
    if (event is WeatherCurrentPositionRequested) {
      yield* _newWeatherCurrentPositionRequested();
    }
  }

  Stream<WeatherState> _newWeatherRequested(WeatherRequested event) async* {
    yield WeatherLoadInProgress();
    try {
      final Weather weather = await WeatherService.fetchCurrentWeather(
          query: event.city, lon: event.lon, lat: event.lat);
      yield WeatherLoadSuccess(weather: weather);
    } catch (_) {
      yield WeatherLoadFailure();
    }
  }

  Stream<WeatherState> _newWeatherCurrentPositionRequested() async* {
    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.whileInUse ||
        permission == LocationPermission.always) {
      Position lastKnownPosition = await Geolocator.getLastKnownPosition();
      if(lastKnownPosition != null) {
        add(WeatherRequested(
            lat: lastKnownPosition.latitude.toString(),
            lon: lastKnownPosition.longitude.toString()));

      } else {
        Position position =
        await Geolocator.getCurrentPosition(desiredAccuracy: LocationAccuracy.high);
        add(WeatherRequested(
            lat: position.latitude.toString(),
            lon: position.longitude.toString()));
      }
    } else {
      await Geolocator.requestPermission();
      add(WeatherCurrentPositionRequested());
    }
  }

}