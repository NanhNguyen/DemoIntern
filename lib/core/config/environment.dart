enum Environment { dev, staging, prod }

class AppEnvironment {
  static Environment current = Environment.dev;
}
