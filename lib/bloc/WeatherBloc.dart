import 'package:clothes/events/WeatherEvent.dart';
import 'package:clothes/models/Weather.dart';
import 'package:clothes/services/WeatherService.dart';
import 'package:clothes/states/WeatherState.dart';
import 'package:bloc/bloc.dart';


class WeatherBloc extends Bloc<WeatherEvent, WeatherState> {
  final String cityName;
  WeatherBloc(this.cityName) : super(null) {
    add(WeatherRequested(city: cityName));
  }

  @override
  Stream<WeatherState> mapEventToState(WeatherEvent event) async* {
    if (event is WeatherRequested) {
      yield WeatherLoadInProgress();
      try {
        final Weather weather =
        await WeatherService.fetchCurrentWeather(query: event.city);
        yield WeatherLoadSuccess(
            weather: weather);
      } catch (_) {
        yield WeatherLoadFailure();
      }
    }
  }
}