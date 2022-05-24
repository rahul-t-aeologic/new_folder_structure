
import 'app/app.dart';
import 'bootstrap.dart';
import 'core/flavor_config.dart';

void main() {
  bootstrap(() => const App(), Flavor.dev);
}
