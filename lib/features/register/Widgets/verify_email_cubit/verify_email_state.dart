
import '../../../../model/verify_email/send_verify_email_model.dart';

abstract class VerifyEmailStates {}

//------------------VerifyEmail State-----------
class VerifyEmailInitialState extends VerifyEmailStates {}

class VerifyEmailLoadingState extends VerifyEmailStates {}


class VerifyEmailSuccessState extends VerifyEmailStates {
  final SendVerifyEmailModel sendVerifyEmailModel;
  VerifyEmailSuccessState(this.sendVerifyEmailModel);
}

class VerifyEmailErrorState extends VerifyEmailStates {
  final String error;

  VerifyEmailErrorState(this.error);
}

//------------------Change Password Visibility State-----------

class VerifyEmailChangePasswordVisibilityState extends VerifyEmailStates {}


//------------------CacheHelperSaveDataState-----------
class CacheHelperSaveDataState extends VerifyEmailStates {}


//----------------------------------------------------------
