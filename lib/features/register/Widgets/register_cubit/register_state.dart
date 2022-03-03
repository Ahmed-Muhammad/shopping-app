
import '../../../../model/register/register_model.dart';

abstract class RegisterStates {}

//------------------Register State-----------
class RegisterInitialState extends RegisterStates {}

class RegisterLoadingState extends RegisterStates {}

class RegisterSuccessState extends RegisterStates {
  final RegisterModel registerModel;
  RegisterSuccessState(this.registerModel);
}

class RegisterErrorState extends RegisterStates {
  final String error;

  RegisterErrorState(this.error);
}

//------------------Change Password Visibility State-----------

class RegisterChangePasswordVisibilityState extends RegisterStates {}


//------------------CacheHelperSaveDataState-----------
class CacheHelperSaveDataState extends RegisterStates {}



//-------------Verify ------------
class LoadingVerifyEmailState extends RegisterStates {}
class SuccessVerifyEmailState extends RegisterStates {}
class ErrorVerifyEmailState extends RegisterStates {}