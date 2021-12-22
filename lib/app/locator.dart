import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';
import 'package:noto_app/app/locator.config.dart';

final getIt = GetIt.instance;

@InjectableInit(
  initializerName: r'$initGetIt', // default
  preferRelativeImports: true, // default
  asExtension: false, // default
)
void configureDependencies() => $initGetIt(getIt);
