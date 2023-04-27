part of 'home_cubit.dart';

class HomeState extends Equatable {
  final RequestState? getHomeState;
  final HomeResponse? homeResponse;
  final RequestState? getDataQuran;

  HomeState({this.getHomeState, this.homeResponse, this.getDataQuran});

  HomeState copyWith({final RequestState? getDataQuran,
    final RequestState? getHomeState,
  final HomeResponse? homeResponse,
  }) => HomeState(
    getDataQuran: getDataQuran??this.getDataQuran,
     getHomeState: getHomeState??this.getHomeState,
      homeResponse: homeResponse??this.homeResponse
  );

  @override
  List<Object?> get props => [getHomeState, homeResponse, getDataQuran];
}
