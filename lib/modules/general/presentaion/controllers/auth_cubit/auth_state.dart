part of 'auth_cubit.dart';

class AuthState extends Equatable {
// register
  final RequestState? registerUserState;
  final ResponseRegister? responseRegister;

//login
  final UserResponseModel? userResponseModel;
  final RequestState? loginUserState;
  final AddressModel? currentCountry;
    final AddressModel? currentGender;

  const AuthState(
      {this.registerUserState,
      this.responseRegister,
      this.currentCountry, this.currentGender, 
      this.userResponseModel,

      this.loginUserState});

  AuthState copyWith(
      {final registerUserState,
      final responseRegister,
      final userResponseModel,
        final  currentCountry,
    final currentGender,
      final loginUserState}) {
    return AuthState(
      currentGender: currentGender ?? this.currentGender,
        currentCountry: currentCountry ?? this.currentCountry,
        registerUserState: registerUserState ?? this.registerUserState,
        responseRegister: responseRegister ?? this.responseRegister,
        userResponseModel: userResponseModel ?? this.userResponseModel,
        loginUserState: loginUserState ?? this.loginUserState);
  }

  @override
  List<Object?> get props =>
      [registerUserState, responseRegister, userResponseModel, loginUserState,currentCountry,currentGender];
}
