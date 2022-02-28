
abstract class SocialLoginStates {}

class SocialLoginInitialState extends SocialLoginStates {}

class SocialLoginLoadingState extends SocialLoginStates {}

class SocialLoginSuccessState extends SocialLoginStates
{
  final String Uid;
  SocialLoginSuccessState(this.Uid);
}

class SocialLoginErrorState extends SocialLoginStates {
  final String error;
  SocialLoginErrorState(this.error);

}
class SocialChangePasswordVisibilityState extends SocialLoginStates {}