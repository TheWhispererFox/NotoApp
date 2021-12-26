// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import '../data/repositories/firestore/firestore_note_repository.dart' as _i4;
import '../services/auth_service.dart' as _i3;
import '../services/connection_service.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.AuthService>(() => _i3.AuthService());
  gh.factory<_i4.FirestoreNoteRepository>(() => _i4.FirestoreNoteRepository());
  gh.singleton<_i5.NetworkConnectionService>(_i5.NetworkConnectionService());
  return get;
}
