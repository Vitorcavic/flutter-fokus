import 'package:flutter_test/flutter_test.dart';
import 'package:fokus/app/shared/enums/timer_type.dart';

void main() {

  group('TimerType enum', () {
    test('deve conter os tres modos esperados', () {
      expect(TimerType.values.length, 3);
      expect(
        TimerType.values, 
        containsAll([TimerType.focus, TimerType.shortBreak, TimerType.longBreak]),
      );
    });

    test(
      'Cada modo possui o titulo, a imagem e os minutos corretos / esperados', 
      () {
        expect(TimerType.focus.title, 'Modo Foco');
        expect(TimerType.focus.imageName, 'assets/focus.png');
        expect(TimerType.focus.minutes, 25);

        expect(TimerType.shortBreak.title, 'Pausa Curta');
        expect(TimerType.shortBreak.imageName, 'assets/pause.png');
        expect(TimerType.shortBreak.minutes, 5);

        expect(TimerType.longBreak.title, 'Pausa Longa');
        expect(TimerType.longBreak.imageName, 'assets/long.png');
        expect(TimerType.longBreak.minutes, 15);
      },
    );
  }); 
}