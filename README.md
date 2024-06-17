## Setting up development environment

```bash
$ flutter pub get
$ flutter create .
$ mason get # optional
```

## Code generation

Repository relies on code generation. It can be run in two modes:

1. `dart run build_runner build` - Runs generation only once and exits. Good for CI.
2. `dart run build_runner watch` - Runs generation at startup and re-runs it when any file changes. Good for development.
