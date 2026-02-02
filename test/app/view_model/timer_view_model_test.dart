import 'package:flutter/foundation.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:fokus/app/view_model/timer_view_model.dart';

void main () {
  group('TimerViewModel', () {
    late TimerViewModel vm;
    late ValueNotifier<bool> isPaused;

    setUp(() {
      vm = TimerViewModel();
      isPaused = ValueNotifier<bool>(false);
    });
    test('Inicia parado com duracao zero', () {
      expect(vm.isPlaying, isFalse);
      expect(vm.duration, Duration.zero);
    });

    group('StartTimer', () {
      test('Liga o temporizador e zera a duracao', () {
        vm.duration = Duration(minutes: 10);
        vm.startTimer(5, isPaused);

        expect(vm.isPlaying, isTrue);
        expect(vm.duration, Duration.zero);
      });

      test('Incremente a cada segundo quando nao esta pausado', () async {
        vm.startTimer(5, isPaused);
        await Future.delayed(Duration(seconds: 1));
        expect(vm.duration.inSeconds, 1);
      });

      test('Nao incrementa o valor quando esta pausado', () async {
        isPaused.value = true;
        vm.startTimer(5, isPaused);
        await Future.delayed(Duration(seconds: 1));
        expect(vm.duration, Duration.zero);

        isPaused.value = false;
        await Future.delayed(Duration(seconds: 1));
        expect(vm.duration.inSeconds, 1);
      });
    });

    group('StopTime', () {
      test('Desliga o temporizador', () {
        vm.startTimer(1, isPaused);
        expect(vm.isPlaying, isTrue);
        vm.stopTime();
        expect(vm.isPlaying, isFalse);
      });
    });
  });
}