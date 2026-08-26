# Coverage commands by stack

Comandos de coverage con reporte de **líneas** y, cuando la herramienta lo soporta, **branches**. Detección en orden: aplica la primera coincidencia.

## Detection order

1. `composer.json` / `phpunit.xml` → PHP
2. `package.json` (+ `tsconfig.json` presente → TypeScript, si no → JavaScript)
3. `pyproject.toml` / `setup.cfg` / `pytest.ini` → Python
4. `go.mod` → Go
5. `Cargo.toml` → Rust
6. `pom.xml` / `build.gradle` → Java/Kotlin
7. `Gemfile` + `spec/` → Ruby
8. `*.csproj` / `*.sln` → C#/.NET
9. `CMakeLists.txt` / `Makefile` → C/C++
10. `pubspec.yaml` → Dart/Flutter

## Per stack

| Stack | Detect by | Coverage command | Branch reporting |
|---|---|---|---|
| PHP | `composer.json` (`phpunit/phpunit`) o `phpunit.xml` | `vendor/bin/phpunit --coverage-text --coverage-html build/coverage` | `--path-coverage` (requiere Xdebug ≥ 3 o PCOV) |
| JavaScript | `package.json` + jest/vitest | `npx jest --coverage` / `npx vitest run --coverage` | Sí (istanbul) |
| TypeScript | `tsconfig.json` + jest/vitest | `npx jest --coverage` (ts-jest) / `npx vitest run --coverage` (requiere `@vitest/coverage-v8`) | Sí |
| Python | `pyproject.toml` / `setup.cfg` / `pytest.ini` | `python -m pytest --cov --cov-branch --cov-report=term-missing` (requiere `pytest-cov`) | `--cov-branch` |
| Go | `go.mod` | `go test -coverprofile=cover.out ./...` y luego `go tool cover -func=cover.out` | No (solo líneas; `-covermode=atomic`) |
| Rust | `Cargo.toml` | `cargo llvm-cov` / `cargo tarpaulin --out html` | `cargo llvm-cov` sí; tarpaulin limitado |
| Java/Kotlin | `pom.xml` / `build.gradle` | `mvn test jacoco:report` / `gradle test jacocoTestReport` | Sí (JaCoCo) |
| Ruby | `Gemfile` + `spec/` | `bundle exec rspec` (con `SimpleCov` en el setup de tests) | `SimpleCov.enable_coverage :branch` (Ruby ≥ 3) |
| C#/.NET | `*.csproj` / `*.sln` | `dotnet test --collect:"XPlat Code Coverage"` y luego `reportgenerator` | Sí (coverlet) |
| C/C++ | `CMakeLists.txt` / `Makefile` | compilar con `--coverage`, luego `lcov --capture --directory . --output-file coverage.info --rc lcov_branch_coverage=1` + `genhtml` | `lcov_branch_coverage=1` |
| Dart/Flutter | `pubspec.yaml` | `flutter test --coverage` | No (solo líneas/funciones) |

## Reading the gap

- `term-missing` (pytest) y `--coverage-text` (PHPUnit) listan las líneas sin cubrir directamente.
- Para el resto, el gap = la intersección entre las líneas/branches sin cubrir del reporte y las líneas/branches del diff.
- Acota la ejecución a los archivos del diff cuando la herramienta lo permita, para que corra rápido (p. ej. `pytest --cov=path/to/cambiado.py path/to/cambiado.py`).