# codemagic_demo

Проста Flutter-апка на 1 екран для вивчення CI/CD на [Codemagic](https://codemagic.io).

## Локальний запуск

```bash
flutter pub get
flutter run
flutter test
flutter analyze
```

## CI/CD

Конфіг — `codemagic.yaml` у корені репо. Codemagic сам його підхоплює, коли підключити репозиторій
(Apps → Add application → підключити Git-провайдер → обрати репо → "Use codemagic.yaml").

Два workflow, обидва на Linux-інстансах (розробка ведеться з Windows, iOS-збірки не потрібні):

| Workflow | Інстанс | Тригер | Що робить |
|---|---|---|---|
| `android-debug` | linux_x2 | push / PR у будь-яку гілку | analyze + test + debug APK |
| `android-release` | linux_x2 | тег `v*` | analyze + test + release APK і AAB |

### Наступні кроки для навчання

1. Підключити репо в Codemagic і запустити `android-debug` вручну.
2. Подивитись на вкладку Tests — там зʼявиться звіт із `test-report.json`.
3. Додати code signing: Android keystore (Teams → Code signing identities) і
   `android_signing:` у workflow.
4. Додати публікацію: `publishing: google_play:` або Firebase App Distribution.
5. Поекспериментувати з `environment: groups:` для секретів замість хардкоду.
