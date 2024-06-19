import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:robot_de_multimedia/data/datasources/media_local_datasources.dart';
import 'package:robot_de_multimedia/data/repositories/media_repository_impl.dart';
import 'package:robot_de_multimedia/domain/repositories/media_repository.dart';
import 'package:robot_de_multimedia/domain/usecases/media_use_cases.dart';

//Riverpod: .read para hacer cambios | .watch para solo observar

final mediaLocalDatasourceProvider = Provider<MediaLocalDatasource>((ref) {
  // Aquí debes retornar una instancia de tu MediaLocalDatasource.
  // Esto podría implicar la creación de una nueva instancia de MediaLocalDatasource,
  // o tal vez obtenerla de alguna otra parte, dependiendo de tu implementación.
  return MediaLocalDatasourceImpl(); // Asume que tienes una implementación de MediaLocalDatasource llamada MediaLocalDatasourceImpl
});

final mediaRepositoryProvider = Provider<MediaRepository>((ref) {
  final localDataSource = ref.watch(mediaLocalDatasourceProvider);
  return MediaRepositoryImpl(localDataSource: localDataSource);
});

final mediaUseCaseProvider = Provider<MediaUseCase>((ref) {
  final repositorio = ref.watch(mediaRepositoryProvider);
  return MediaUseCase(repositorio: repositorio);
});

final buttonContinue = StateNotifierProvider<ButtonNotifier, bool>((ref) {
  return ButtonNotifier();
});

class ButtonNotifier extends StateNotifier<bool> {
  ButtonNotifier() : super(false);

  void enableButton() {
    state = true;
  }
}
