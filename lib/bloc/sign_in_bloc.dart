import 'package:email_validator/email_validator.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:form_validation_bloc/bloc/sign_in_event.dart';
import 'package:form_validation_bloc/bloc/sign_in_state.dart';

class SignInBloc extends Bloc<SignInEvent, SignInState> {
  SignInBloc() : super(SignInInitialState()) {
    on<SignInTextChangeEvent>((event, emit) {
      if (
          EmailValidator.validate(event.emailValue) == false) {
        emit(SignInErrorState('please enter a valid email address'));
      } else if (event.passwordValue.length < 8) {
        emit(SignInErrorState('Please Enter a valid password'));
      } else {
        emit(SignInValidState());
      }
    });
    on<SignInTextSubmittedEvent>((event, emit) {
      emit(SignInLoadingState());
    });
  }
}
