import 'package:clothes/CustomColors.dart';
import 'package:flutter/material.dart';

class EvalationSlider extends StatefulWidget {
  const EvalationSlider({super.key});

  @override
  State<EvalationSlider> createState() => EvalationSliderState();
}

class EvalationSliderState extends State<EvalationSlider> {
  double _value = 50.0;
  int step = 0;
  var _status = '';

  @override
  Widget build(BuildContext context) {
    return SliderTheme(
              data: SliderTheme.of(context).copyWith(
                valueIndicatorColor: CustomColors.dark_brown_tint2,
                activeTickMarkColor: Colors.white,
                inactiveTickMarkColor: Colors.brown[800],
                trackHeight: 15.0,
                trackShape: const RoundedRectSliderTrackShape(),
                thumbShape: const RoundSliderThumbShape(
                  enabledThumbRadius: 14.0,
                  pressedElevation: 8.0,
                ),
                overlayColor: Colors.brown[100],
                valueIndicatorTextStyle: TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.w300,
                  color: Colors.white,
                ),
              ),
              child: Slider(
                  value: _value,
                  min: 0,
                  max: 100,
                  divisions: 4,
                  activeColor: Colors.brown[800],
                  inactiveColor: Colors.brown[300],
                  thumbColor: Colors.brown,
                  label: _status,
                  onChanged: (double value) {
                    setState(() {
                      _value = value;
                      step = _value.toInt();
                      if (step == 0) _status = 'Холодно';
                      if (step == 25) _status = 'Слегка Холодно';
                      if (step == 50) _status = 'Нормально';
                      if (step == 75) _status = 'Слегка жарко';
                      if (step == 100) _status = 'Очень жарко';
                    });
                  }),
            );
  }
}
