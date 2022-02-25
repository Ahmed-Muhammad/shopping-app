
abstract class LoginStates {}
//------------------Login State-----------
class LoginInitialState extends LoginStates {}
class LoginLoadingState extends LoginStates {}
class LoginSuccessState extends LoginStates {}
class LoginErrorState extends LoginStates {
  final String error;
  LoginErrorState(this.error);
}

//------------------Change Password Visibility State-----------

class LoginChangePasswordVisibilityState extends LoginStates {}