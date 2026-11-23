import 'package:flutter_test/flutter_test.dart';
import 'package:oyun_isim_sehir/oyun_isim_sehir.dart';
import 'package:studio_core/core/level_plan.dart';

void main() {
  test('33 dilde ad ve anlatım', () {
    expect(isimSehirConfig.title.length, 33);
    expect(isimSehirConfig.tagline.length, 33);
    for (final s in isimSehirConfig.tutorial) {
      expect(s.text.length, 33);
    }
    expect(isimSehirConfig.gameId, isimSehirId);
    expect(isimSehirRules.gameId, isimSehirId);
  });

  test('desteler kurulur ve doğrulanır', timeout: const Timeout(Duration(minutes: 10)), () {
    expect(isimSehirRules.levelCount, 100000);
    final planner = LevelPlanner(gameId: isimSehirId, optionalMechanics: isimSehirRules.optionalMechanics);
    for (final lv in [1, 77, 1500, 33333, 99999]) {
      expect(isimSehirRules.build(planner.spec(lv)).validation.ok, isTrue, reason: 'bölüm $lv');
    }
  });
}
