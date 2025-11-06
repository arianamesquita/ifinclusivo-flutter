import 'main_dev.dart' as dev;
import 'main_prod.dart' as prod;

void main() {
  const bool isProd = bool.fromEnvironment('dart.vm.product');

  if (isProd) {
    prod.main();
  } else {
    dev.main();
  }
}
