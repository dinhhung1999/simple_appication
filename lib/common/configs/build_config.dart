enum Environment { dev, prod }

abstract class BuildConfigs {
  String url();

  Environment get env;

  BuildConfigs._();

  factory BuildConfigs(Environment env) {
    switch (env) {
      case Environment.dev:
        return _DevBuildConfigs();
      case Environment.prod:
        return _ProdBuildConfigs();
    }
  }
}

class _DevBuildConfigs extends BuildConfigs {
  _DevBuildConfigs() : super._();

  @override
  Environment get env => Environment.dev;

  @override
  String url() {
    return 'https://demo4664447.mockable.io/';
  }
}

class _ProdBuildConfigs extends BuildConfigs {
  _ProdBuildConfigs() : super._();

  @override
  Environment get env => Environment.prod;

  @override
  String url() {
    return '';
  }
}
