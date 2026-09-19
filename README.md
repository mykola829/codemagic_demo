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

Два workflow, обидва збирають тільки Android (розробка ведеться з Windows, iOS-білди не потрібні).
`instance_type` навмисно не заданий — Codemagic бере дефолтний інстанс, доступний поточному плану:

| Workflow | Інстанс | Тригер | Що робить |
|---|---|---|---|
| `android-debug` | default | push / PR у будь-яку гілку | analyze + test + debug APK |
| `android-release` | default | тег `v*` | analyze + test + release APK і AAB |

### Наступні кроки для навчання

1. Підключити репо в Codemagic і запустити `android-debug` вручну.
2. Подивитись на вкладку Tests — там зʼявиться звіт із `test-report.json`.
3. Додати code signing: Android keystore (Teams → Code signing identities) і
   `android_signing:` у workflow.
4. Додати публікацію: `publishing: google_play:` або Firebase App Distribution.
5. Поекспериментувати з `environment: groups:` для секретів замість хардкоду.
