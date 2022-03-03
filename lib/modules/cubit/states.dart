abstract class States {}

class appInitStates extends States {}

class RegisterLoadingState extends States {}

class RegisterSuccessState extends States {}

class RegisterErrorState extends States {}

class LoginLoadingState extends States {}

class LoginSuccessState extends States {}

class LoginErrorState extends States {
  final String error;
  LoginErrorState({required this.error});
}

class CreateUserSuccessState extends States {}

class CreateUserErrorState extends States {}

class BillLoadingState extends States {}

class BillSuccessState extends States {}

class BillErrorState extends States {}
