abstract class SignInEvent {}

class SignInTextChangeEvent extends SignInEvent {
  final String emailValue;
  final String passwordValue;
  SignInTextChangeEvent(this.emailValue, this.passwordValue);
}

class SignInTextSubmittedEvent extends SignInEvent {

}
