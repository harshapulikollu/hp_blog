part of 'home_cubit.dart';

sealed class HomeState extends Equatable {
  const HomeState();
}

final class HomeInitial extends HomeState {
  @override
  List<Object> get props => [];
}

class HomeLoading extends HomeState {
  @override
  List<Object?> get props => [];
}

class HomeLoadedSuccessfully extends HomeState {
  final List<Post> responseApi;

  const HomeLoadedSuccessfully({required this.responseApi});
  @override
  List<Object?> get props => [responseApi];
}

class HomeLoadingFailed extends HomeState {
  @override
  List<Object?> get props => [];
}
