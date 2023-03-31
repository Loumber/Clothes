import 'package:clothes/events/WeatherEvent.dart';
import 'package:clothes/models/Weather.dart';
import 'package:clothes/services/WeatherService.dart';
import 'package:clothes/states/WeatherState.dart';
import 'package:bloc/bloc.dart';
import 'package:geolocator/geolocator.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  //final String cityName;
  WeatherBloc() : super(WeatherInitial()) {
    on<WeatherRequested>(_newWeatherRequested);
    on<WeatherCurrentPositionRequested>(_newWeatherCurrentPositionRequested);
  }



   _newWeatherRequested(WeatherRequested event, Emitter<WeatherState> emit) async {
    emit(WeatherLoadInProgress());
    try {
      final Weather weather = await WeatherService.fetchCurrentWeather(
          query: event.city, lon: event.lon, lat: event.lat);
      emit(WeatherLoadSuccess(weather: weather));
    } catch (_) {
      emit(WeatherLoadFailure());
    }
  }

  _newWeatherCurrentPositionRequested(WeatherCurrentPositionRequested event,
      Emitter<WeatherState> emit) async {
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